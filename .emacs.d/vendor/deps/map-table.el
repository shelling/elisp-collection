;;; map-table.el
;;;
;;; Copyright (C) 1997, 1998, 2004, 2006, 2007, 2008 Thien-Thi Nguyen
;;;
;;; This file is part of ttn's personal elisp library, released under
;;; the terms of the GNU General Public License as published by the
;;; Free Software Foundation; either version 3, or (at your option) any
;;; later version.  There is NO WARRANTY.  See file COPYING for details.

;;; Description: Provide "table" mapping funcs.
;;; Basically, interpret a single list as tabular, chunking
;;; some number of CARs and passing that to its function.

(require 'cl)

;;;###autoload
(defun map-table (n func seq)
  "Pass first N elements from SEQ as args to FUNC.  Repeat and accumulate."
  (let (retval args)
    (while seq
      (setq args nil)
      (dotimes (i n)
        (push (pop seq) args))
      (push
       (apply func (nreverse args))
       retval))
    (nreverse retval)))

;;;###autoload
(defun map-table-2col (func table)
  "Apply FUNC to 2-column TABLE, of form (A1 B1 A2 B2 ...)."
  (map-table 2 func table))
(put 'map-table-2col 'lisp-indent-function 1)

;;;###autoload
(defun map-table-3col (func table)
  "Apply FUNC to 3-column TABLE, of form (A1 B1 C1 A2 B2 C2 ...)."
  (map-table 3 func table))
(put 'map-table-3col 'lisp-indent-function 1)

(provide 'map-table)

;;; map-table.el ends here
