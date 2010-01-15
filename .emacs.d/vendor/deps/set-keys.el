;;; set-keys.el
;;;
;;; Copyright (C) 1997, 1998, 2004, 2007, 2008 Thien-Thi Nguyen
;;;
;;; This file is part of ttn's personal elisp library, released under
;;; the terms of the GNU General Public License as published by the
;;; Free Software Foundation; either version 3, or (at your option) any
;;; later version.  There is NO WARRANTY.  See file COPYING for details.

;;; Description: Bind many keys in a keymap, not just one.
;;; This is an application of `map-table' and ilk.

(require 'map-table)

;;;###autoload
(defun define-keys (keymap table &rest more)
  "Modify KEYMAP from TABLE.
If TABLE is a list of the form (key1 binding1 key2 binding2 ...),
use it directly.  Otherwise, TABLE should be `key1' and MORE...
should be `binding1 key2 binding2 ...'."
  (map-table-2col (lambda (key def)
                    (define-key keymap key def))
    (if (listp table)
        table
      (cons table more))))

;;;###autoload
(defun local-set-keys (table &rest more)
  "Like `local-set-key', but from TABLE (and MORE...).
See `define-keys' for the meaning of TABLE and MORE."
  (map-table-2col 'local-set-key
    (if (listp table)
        table
      (cons table more))))

;;;###autoload
(defun global-set-keys (table &rest more)
  "Like `global-set-key', but from TABLE (and MORE...).
See `define-keys' for the meaning of TABLE and MORE."
  (map-table-2col 'global-set-key
    (if (listp table)
        table
      (cons table more))))

(provide 'set-keys)

;;; set-keys.el ends here
