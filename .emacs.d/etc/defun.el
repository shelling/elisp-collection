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

;; __COMPILING_COMVENTION__
(defun recompile-emacs.d ()
  "recompile ~/.emacs.d/"
  (interactive)
  (byte-recompile-directory (expand-file-name "~/.emacs.d/")))

(defun recompile-emacs.d-all ()
  "recompile ~/.emacs.d/, only modified files. also compile these files corresponding no .elc"
  (interactive)
  (byte-recompile-directory (expand-file-name "~/.emacs.d/") 0))

(defun recompile-emacs.d-force ()
  "the same as recompile-emacs.d-all, force version"
  (interactive)
  (byte-recompile-directory (expand-file-name "~/.emacs.d/") 0 t))


;; __EXPERIMENTAL__
(defun replace-region-with-just-yanking ()
  "replace region with last key ring"
  (interactive)
  (delete-region)
  (yank))

(defun sidebar-buffer-list ()
  "open a sidebar to show buffer list"
  (interactive)
  (make-frame '((name . "buffer sidebar")
                (width . 26)
                (height . 53)
                (top . 26)
                (left . 100)
                (minibuffer . nil))))

(defun echo (expr)
  "echo"
  (interactive "sExpr: ")
  (message (eval expr)))


(defmacro inc (var)
  ;; simple macro definition example
  (list 'setq var (list '+ 1 var)))



(provide 'defun)