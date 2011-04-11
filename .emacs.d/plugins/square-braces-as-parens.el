;;; square-braces-as-parens.el
;;;
;;; Copyright (C) 2000, 2004, 2007, 2008 Thien-Thi Nguyen
;;;
;;; This file is part of ttn's personal elisp library, released under
;;; the terms of the GNU General Public License as published by the
;;; Free Software Foundation; either version 3, or (at your option) any
;;; later version.  There is NO WARRANTY.  See file COPYING for details.

;;; Description: Minor mode to bind parens to square-braces keys, per buffer.

;;;###autoload
(defvar square-braces-as-parens-mode nil
  "If non-nil, \"[\" and \"]\" insert \"(\" and \")\", respectively.")

(defun square-braces-as-parens-insert (n yes no)
  (while (< 0 n)
    (insert (if square-braces-as-parens-mode yes no))
    (setq n (1- n))))

;;;###autoload
(defvar sbap-close-everything-magic-char 17
  "*When closing, if preceding char is this char, delete the char and
close everything (so that the top-level form is closed) one paren at a
time w/ a delay between each paren.  Any input before the closing is
finished cancels the rest of the parens.  A value of nil means never do
close-everything behavior.  Default value is ^Q (C-q).")

;;;###autoload
(defvar sbap-close-everything-delay-factor 0.05
  ;; Thanks go to Dave Pearson for this idea.
  "*Delay factor used when closing everything, larger means slower.
Set to zero for instantaneous closing.  Default value is 0.05.")

;; This function adapted from gnu.emacs.help post
;; <8up9l1$6dh$1@nnrp1.deja.com> by Kevin Rodgers.
(defun square-braces-as-parens-close-everything ()
  (interactive)
  (let ((last-command-char ?\))
        (depth (car (parse-partial-sexp (save-excursion
                                          (beginning-of-defun)
                                          (point))
                                        (point)))))
      (while (and (not (input-pending-p))
                  (< 0 depth))
        ;; why is this better than using `insert'?  --ttn
        (call-interactively 'self-insert-command)
        (sit-for (* sbap-close-everything-delay-factor
                    (setq depth (1- depth)))))))

;;;###autoload
(defun square-braces-as-parens-mode (&optional arg)
  (interactive "P")
  (setq square-braces-as-parens-mode
        (if (null arg)
            (not square-braces-as-parens-mode)
          (> (prefix-numeric-value arg) 0)))
  ;; these days probably this is better done using another mechanism
  (local-set-key "[" (lambda (n)
                       (interactive "p")
                       (square-braces-as-parens-insert n "(" "[")))
  (local-set-key "]" (lambda (n)
                       (interactive "p")
                       (if (or (not sbap-close-everything-magic-char)
                               (/= sbap-close-everything-magic-char
                                   (char-before))
                               (not square-braces-as-parens-mode))
                           (square-braces-as-parens-insert n ")" "]")
                         (delete-char -1)
                         (square-braces-as-parens-close-everything))))
  (when (interactive-p)
    (message "Square braces as parens mode: %s"
             (if square-braces-as-parens-mode "on" "off"))))

;; load time action
(dolist (var '(square-braces-as-parens-mode
               sbap-close-everything-magic-char
               sbap-close-everything-delay-factor))
  (make-variable-buffer-local var)
  (put var 'permanent-local t))

;; that's it
(provide 'square-braces-as-parens)

;;; square-braces-as-parens.el ends here
