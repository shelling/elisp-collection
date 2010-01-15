;; defun.el
;;

(defun join-line-below ()
  (interactive)
  (next-line)
  (join-line))


(defun kill-buffer-and-frame ()
  (interactive)
  (if (kill-buffer nil)
      (delete-frame)
      ()))

(defmacro inc (var)
  ;; simple macro definition
  (list 'setq var (list '+ 1 var)))