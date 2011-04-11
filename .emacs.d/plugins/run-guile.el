;;; run-guile.el
;;;
;;; Copyright (C) 1997, 1998, 1999, 2000, 2001, 2004, 2006,
;;;   2007, 2008 Thien-Thi Nguyen
;;;
;;; This file is part of ttn's personal elisp library, released under
;;; the terms of the GNU General Public License as published by the
;;; Free Software Foundation; either version 3, or (at your option) any
;;; later version.  There is NO WARRANTY.  See file COPYING for details.

;;; Description: Run a Guile interpreter repl in a buffer.

(require 'cmuscheme)
(require 'comint)
(require 'square-braces-as-parens)
(require 'set-keys)

;;;###autoload
(defun run-guile (flavor &optional edit-cmd-p)
  "Run a Guile interpreter repl w/ FLAVOR in a buffer.
If FLAVOR (a string) is non-empty, arrange for the interpreter to
have environment variable \"EMACS_GUILE_FLAVOR\" set to FLAVOR.
The intention is that further customizations can be specified in
file ~/.guile by examining the value of this var.  For example:

 (case (and=> (getenv \"EMACS_GUILE_FLAVOR\") string->symbol)
   ((pg)  (use-modules (database postgres)))
   ((sdl) (use-modules (sdl sdl) (sdl misc-utils))))

Prefix arg means query for command line (default: \"guile\").
The variable `scheme-buffer' is set to the new buffer, and the
keys `[' and `]' insert left- and right-parens, respectively.
Additionally, `C-h C-g' runs a \"Guile help\" command, and
`C-h C-a' runs a \"Guile apropos\" command."
  (interactive "sFlavor: \nP")
  (let* ((process-environment (if (string= "" flavor)
                                  process-environment
                                (cons (format "EMACS_GUILE_FLAVOR=%s" flavor)
                                      process-environment)))
         (program "guile")
         (scheme-program-name
          (or (when (and edit-cmd-p (not noninteractive))
                (read-string "Run Guile: " program))
              program)))
    (run-scheme scheme-program-name)
    (setq scheme-buffer (rename-buffer (format "*%s*" scheme-program-name)))
    (local-set-keys
     "\C-h\C-g" (lambda (s) (interactive "sGuile help: ")
                  (cond ((string-match "^[ ]" s)
                         (insert "(help" s ")")
                         (comint-send-input))
                        (t
                         (info "(guile)")
                         (Info-index s))))
     "\C-h\C-a" (lambda (s) (interactive "sGuile apropos: ")
                  (insert "(apropos \"" s "\")")
                  (comint-send-input))
     "\C-cf" (lambda (file) (interactive "fFile: ")
               (insert "#\C-f" file)))
    (square-braces-as-parens-mode 1)))

(provide 'run-guile)

;;; run-guile.el ends here
