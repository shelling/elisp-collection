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


(defmacro inc (var)
  ;; simple macro definition example
  (list 'setq var (list '+ 1 var)))