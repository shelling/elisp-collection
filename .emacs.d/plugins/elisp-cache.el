;; Copyright 2008 Google Inc.
;; 
;; This program is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation; either version 2 of the License, or (at your option) any later
;; version.
;; 
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
;; details.
;; 
;; You should have received a copy of the GNU General Public License along with
;; this program; if not, write to the Free Software Foundation, Inc., 51
;; Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Cache Elisp files from the server; thus start up faster and enable roaming.
;;
;; Author: Dominique Quatravaux (domq@google.com)
;;
;; A popular setup in corporate networks is to store some in-house Elisp files
;; on a file server of some sort - this is convenient for a team of hackers who
;; use Emacs, but can be slow and/or problematic eg when using a laptop.  With
;; this module, Emacs will create a cache of Elisp files (it can even
;; byte-compile them while it's at it!).  Freshness of the cache is only checked
;; every once in a while, so that Emacs will typically start up without touching
;; the file server even once.
;;
;; To use this module:
;;
;;  1. Choose a local directory to store the cache
;;
;;  2. Add something like this to your ~/.emacs:
;;
;;      (let ((nfsdir "/auto/fileserver/elisp")
;;            (cachedir "/home/fred/var/elisp-cache"))
;;         (setq load-path (append load-path (list cachedir nfsdir)))
;;         (require 'elisp-cache)
;;         (elisp-cache nfsdir cachedir)
;;      ;; Or maybe this instead, if the directory contains more than
;;      ;; Elisp code:
;;         ; (elisp-cache nfsdir cachedir
;;         ; '((:filelist "foo.el" "bar/baz.el")))
;;        )
;;      (require 'some-spiffy-corporate-module)
;;
;;  3. Start Emacs and watch it build the cache.
;;
;;  4. Quit Emacs, restart it, and watch it *not* rebuild the cache.
;;
;;  5. Profit!!
;;
;; The first time Emacs runs, it will copy over all files from `nfsdir' to
;; `cachedir', and then check periodically for modifications in `nfsdir'.
;; If you want to invalidate the cache manually, just use good old "rm -rf".
;;
;; If you don't want to wait, ever, then arrange for a crontab to start Emacs in
;; batch mode, eg as "emacs --batch -l ~/.emacs".  Schedule that every
;; `elisp-cache-freshness-delay' minutes or less.
;;
;; Known problems (patches welcome):
;;
;;  * Does not work if the file server contains .elc files (only .el files are
;;    supported).

(require 'cl)
(require 'time-date)
(require 'custom)
(require 'advice)

;;;;;;;;;;;;;;;;;;;; Configurable stuff ;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar elisp-cache-version 1.8
"Version number for elisp-cache.el, taken from the Subversion revision")


(defgroup elisp-cache nil
  "Cache for Elisp files (eg from a slow file server)"
  :group 'environment
  :group 'convenience
  :prefix "elisp-cache-")


(defcustom elisp-cache-freshness-delay (* 24 60)
  "The maximum time (in minutes) before we check for changes in the file server.

If all .el (or .elc) files in the cache directory are more recent than this many
hours, then `elisp-cache' will refrain from examining the source directory at
all.  This allows for a very fast startup most of the time."
  :type 'integer
  :group 'elisp-cache)


(defcustom elisp-cache-byte-compile-files nil
  "If set to true, then create .elc files instead of copying .el files.

Please be warned that if you set this variable to a true value and use several
flavors of Emacs, you need to be smart in the invocation of `elisp-cache'
because .elc files are incompatible between Emacs versions.

Also, you should purge your cache (with \"rm -rf\") after changing the value of
this variable, as the cache might misbehave if there is a mixture of .el and
.elc files in it."
  :type 'boolean
  :group 'elisp-cache)


(defcustom elisp-cache-skip-list '("\\.elc\\'")
  "Specifies a list of files or directories to skip.
The elements are regular expressions.  If a directory or file
matches a regexp from this list, it will be ignored."
  :type '(repeat string)
  :group 'elisp-cache)


;;;;;;;;;;;;;;;;;;;; Internal functions ;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun elisp-cache/walk-dir (dirname func &rest args)
  "Walk recursively through DIRNAME.

Invoke FUNC DIRNAME f ARGS on each file underneath it, where f is the *relative*
pathname with respect to DIRNAME.

Symbolic links to files are followed, but not symbolic links to directories
\(which could cause loops)."
  (elisp-cache/do-walk-dir dirname "" func args))
(defun elisp-cache/do-walk-dir (dir file func args)
  (let ((fullpath (expand-file-name file dir)))
;   (message "Examining file or directory %s in dir %s" file dir)
    (cond
     ((not (file-directory-p fullpath)) (apply func dir file args))
     ((file-symlink-p fullpath) nil)
     ((find-if (lambda (regexp)
                 (string-match regexp fullpath))
               elisp-cache-skip-list)
      nil)
     (t
;     (message "Traversing directory %s..." (abbreviate-file-name fullpath))
      (dolist (f (directory-files fullpath))
        (or (string-equal f ".") (string-equal f "..")
            (let* ((subdir (if (string-equal file "") ""
                             (file-name-as-directory file)))
                   (subpath (concat subdir f)))
              (elisp-cache/do-walk-dir dir subpath
                                       func args))))))))


(defun elisp-cache/get-mtimes (dirname &optional filelist)
  "Returns a hash table of mtimes for .el and .elc files under DIRNAME.

If FILELIST is omitted or nil, DIRNAME is searched recursively for files ending
in .el or .elc.  If FILELIST is specified, it shall contain a list of pathnames
relative to DIRNAME; only these files will be examined.

Returns a hash table whose keys are paths relative to DIRNAME and values are
timestamps as produced by the `time-date' module (see eg
`with-decoded-time-value' to decode)."
  (let ((retval (make-hash-table :test 'equal))
        (add-one-mtime-to-hash
         (lambda (maindir subpath hashtable)
           (if (string-match "\\.elc?$" subpath)
               (let* ((full-path (expand-file-name subpath maindir))
                      (mtime (nth 5 (file-attributes full-path))))
                 (puthash subpath mtime hashtable))))))
    (if filelist
        (dolist (relpath filelist)
                (funcall add-one-mtime-to-hash dirname relpath retval))
      (elisp-cache/walk-dir dirname add-one-mtime-to-hash retval))
    retval))


(defun elisp-cache/setcopy-changedp (symbol value)
  "Sets SYMBOL's value to a copy of VALUE; returns true if the value changed."
  (if (equal (symbol-value symbol) value)
      nil
    (set symbol (copy-tree value))
    t
    ))

(defun elisp-cache/replace-prefix (prefix replacewith string)
  "if PREFIX is a prefix of PATH, replaces it with REPLACEPREFIX.

Returns the replaced string, or nil if no replacement occured."
  (if (and (>= (length string) (length prefix))
           (equal prefix (substring string 0 (length prefix))))
      (concat replacewith (substring string (length prefix)))))

;;;;;;;;;;;;;;;;;;;; Public functions ;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun elisp-cache (fromdir todir &optional kwargs-alist)
  "Caches all Elisp files found in FROMDIR into TODIR.

If TODIR did not exist already, it will be created.  In this case, or if TODIR
contains at least one Elisp file older than `elisp-cache-freshness-delay'
hours, then a cache sync occurs.  Finally calls (`elisp-cache-redirect'
FROMDIR TODIR).

A cache sync consists of examining FROMDIR recursively and copying (or
byte-compiling, see `elisp-cache-byte-compile-files') all Elisp files
into TODIR under the same relative path.  If FROMDIR is unreadable or empty,
nothing happens, thereby allowing Emacs to start up off a stale cache, which is
better than not starting at all (eg when on the road with a laptop).

KWARGS-ALIST is an alist of keyword arguments, ie a list of (keyword . value)
cons cells. Accepted keyword arguments are:

  (:filelist . LIST)

    Specifies the relative pathnames of the .el files to encache under FROMDIR.
    This saves a costly directory walk eg for that handful of .el files
    provided as a contrib in a big directory of non-Emacs code.

Note that `elisp-cache' never loads any Elisp files.  It only copies
them (or byte-compiles them)."
  (interactive "DCache startup files from:\nDCache startup files from: %s to: ")
  (let* ((fromdir (file-name-as-directory fromdir))
         (todir (file-name-as-directory todir))
         (todir-existed (if (file-directory-p todir) t
                          (make-directory todir t) nil))
         (todir-h (elisp-cache/get-mtimes todir))
         (oldest-mtime nil)
         (_ (maphash (lambda (path mtime)
                       (if (or (not oldest-mtime)
                               (time-less-p mtime oldest-mtime))
                           (setq oldest-mtime mtime)))
                     todir-h))
         (found-old-file
          (and oldest-mtime
               (> (/ (time-to-seconds (time-since oldest-mtime)) 60.0)
                  elisp-cache-freshness-delay)))
         (skip-sync (and oldest-mtime ;; Ie don't skip sync on empty cache
                         (not found-old-file))))
    (if (not skip-sync)
      (lexical-let ((fromdir fromdir) (todir todir)
                    (fromdir-h (elisp-cache/get-mtimes fromdir
                                       (cdr (assq :filelist kwargs-alist)))))
        (maphash (lambda (path mtime)
                   (elisp-cache-sync-one-file fromdir todir path))
                 fromdir-h)
        ;; Also a cleanup pass for orphaned files in the cache
        (maphash (lambda (path mtime)
                   (let* ((el-path (progn
                                     (string-match "^\\(.*\\.el\\)c?$" path)
                                     (match-string 1 path)))
                          (other-path
                           (if (equal el-path path) (concat path "c")
                             el-path)))
                     (if (and (not (gethash path fromdir-h))
                              (not (gethash other-path fromdir-h)))
                         (delete-file (expand-file-name path todir)))))
                 todir-h)))
    (elisp-cache-redirect fromdir todir)))


(defun elisp-cache-sync-one-file (fromdir todir relpath)
  "Copies the FROMDIR/RELPATH Elisp file into TODIR if needed.

Depending on the setting of `elisp-cache-byte-compile-files', this will either
create a plain copy or byte-compile the file.  Does nothing if the source file
is older than the target."
  ;; We assume that relpath is always going to end in .el; TODO(domq): also deal
  ;; with a FROMDIR containing .elc files, or even a mixture of .el and .elc
  ;; files.
  (let* ((source (expand-file-name relpath fromdir))
         (target-el (expand-file-name relpath todir))
         (target-elc (concat target-el "c"))
         (target-for-mtime (if (file-exists-p target-elc) target-elc target-el))
         (message (format "elisp-cache: %s %s to %s"
                          (if elisp-cache-byte-compile-files
                              "byte-compiling" "copying")
                          source
                          (if elisp-cache-byte-compile-files
                              target-el target-elc))))
    (cond ((file-newer-than-file-p source target-for-mtime)
           (message message)
           (make-directory (file-name-directory target-el) t)
           (if (file-exists-p target-el) (delete-file target-el))
           (if (file-exists-p target-elc) (delete-file target-elc))
           (if (and
                elisp-cache-byte-compile-files
                (condition-case nil
                    (lexical-let ((target-elc target-elc))
                      (flet ((byte-compile-dest-file (unused) target-elc))
                        (byte-compile-file source)
                        t))
                  (error nil))  ;; FWIW, only XEmacs appears to throw exceptions
                                ;; from byte-compile-file, so we must also test
                                ;; that the file actually got created:
                (file-exists-p target-elc))
               t ;; Byte-compile successful, job done
             ;; Copy the .el file in all other cases: that is, the user asked
             ;; for no .elc, *or* the compilation failed.  In the latter case,
             ;; this will at least allow the sync to proceed to completion (and
             ;; in so doing, actually create a cached version no less useful
             ;; than the original) instead of frustrating the user.
             (copy-file source target-el))))))


(defvar elisp-cache-directories-alist nil
  "Alist mapping directories on the file server to directories in the cache.

Don't modify manually, call `elisp-cache-redirect' instead.")


(defun elisp-cache-redirect (fromdir todir)
  "Causes elisp files loaded from TODIR to be looked for in FROMDIR instead.

This does *not* cause a cache sync, unlike `elisp-cache'."
  (add-to-list 'elisp-cache-directories-alist
               (cons (directory-file-name fromdir)
                     (directory-file-name todir)))
  (elisp-cache-update-load-path))


(defvar elisp-cache/update-load-path-memo nil
  "Internal variable, don't fiddle with it!

Memoization of the state from the previous invocation of
`elisp-cache-update-load-path'.")

(defvar elisp-cache/update-load-path-running nil
  "Internal variable, don't fiddle with it!

True if we are currently inside the `elisp-cache-update-load-path' function.")

(defun elisp-cache-update-load-path ()
  "Modifies `load-path' in place, substituting cached directories.

Directories in the `load-path' that have been redirected (ie subdirectories of
the \"fromdir\" parameter to `elisp-cache-redirect') are rewritten into the
corresponding subdirectory in the cache, if it exists.

This function is idempotent; actually if run twice under the same values of
`load-path' and `elisp-cache-directories-alist', it will do nothing the second
time.  Also, this function guards against invoking itself recursively (eg
because of an autoloaded function)."
  (interactive)
  (if (and (not elisp-cache/update-load-path-running)
           (or (elisp-cache/setcopy-changedp
                'elisp-cache/update-load-path-memo
                (list load-path elisp-cache-directories-alist))
               (interactive-p)))
      (let ((elisp-cache/update-load-path-running t)
            (setcar-to-cache (lambda (path-cell)
             "If appropriate, rewrites PATH-CELL's car to point into the cache."
             (let* ((path (expand-file-name (car path-cell)))
                    (cachedpath (some (lambda (mapping)
                                        (elisp-cache/replace-prefix
                                         (expand-file-name (car mapping))
                                         (expand-file-name (cdr mapping))
                                         path))
                                      elisp-cache-directories-alist)))
               (if (and cachedpath (file-exists-p cachedpath))
                   (setcar path-cell cachedpath))))))
        (mapl setcar-to-cache load-path))))


;;;;;;;;;;;;;;;;;;;;;;;;; Side effects ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst elisp-cache-load-functions
  (list 'require 'load-library 'load-file 'load)
  "List of (built-in) functions that can load Elisp files.

Only built-in functions are actually needed here; other functions are ignored.
This constant therefore only needs to be updated whenever a new version of Emacs
defines a new built-in function to load Elisp code, which should be very very
rare now.")

;; Pre-advise all these functions with `elisp-cache-update-load-path'.  This
;; addresses the situation of third-party code altering `load-path' without
;; telling us.  To conserve performance inasmuch as we can,
;; `elisp-cache-update-load-path' has been fitted with a memoize cache.
(dolist (func elisp-cache-load-functions)
  ;; Advise only the built-in functions (detected by subrp).  This also takes
  ;; care of any and all Elisp wrappers around same, eg `require'; see
  ;; explanations in the Info doc about advising primitives.  Some experiments
  ;; under Emacs 21 show that aliases of primitives (created with defalias) are
  ;; also dealt with properly, ie the advice is attached to the subr, not the
  ;; function symbol.
  (if (and (fboundp func) (subrp (symbol-function func)))
      (let* ((func-name (symbol-name func))
             (advice-name (concat func-name "-elisp-cache-update-load-path"))
             (advice-symbol (intern advice-name))
             (advice-docstring (concat "Runs `elisp-cache-update-load-path'"
                                       " before performing `" func-name "'")))
        (eval `(defadvice ,func (before ,advice-symbol activate)
                 ,advice-docstring
                 (elisp-cache-update-load-path))))))


(provide 'elisp-cache)
