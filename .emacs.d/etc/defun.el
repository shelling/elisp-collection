;; defun.el
;;

(defun join-line-below ()
  "join current line and below line together without white space"
  (interactive)
  (next-line)
  (join-line))


(defun kill-buffer-and-frame ()
  "kill current buffer as well as close current frame immediately"
  (interactive)
  (if (kill-buffer nil)
      (delete-frame)
      ()))

(defmacro inc (var)
  ;; simple macro definition
  (list 'setq var (list '+ 1 var)))