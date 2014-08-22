;; defun.el
;;

(defun make-frame-default ()
  "reset frame height and width as the same as frame-setting"
  (interactive)
  (set-frame-height nil
                    (cdr (assoc 'height frame-setting)))
  (set-frame-width nil
                   (cdr (assoc 'width frame-setting))))

(defun reload ()
  "reload ~/.emacs"
  (interactive)
  (load-file (expand-file-name "~/.emacs")))

(defun traditional-console-frame ()
  "set height and width of frame to 80x24"
  (interactive)
  (set-frame-width  nil 80)
  (set-frame-height nil 24))

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
(defun sr-speedbar-focus-toggle ()
  (interactive)
  (if (sr-speedbar-exist-p)
      (sr-speedbar-close)
    (sr-speedbar-open))
  (if (sr-speedbar-exist-p)
      (sr-speedbar-select-window)
    nil))

;; (defun replace-region-with-just-yanking ()
;;   "replace region with last key ring"
;;   (interactive)
;;   (delete-region)
;;   (yank))

(defun transparency (value)
  "set transparency of the frame. 0=transparent, 100=opaque"
  (interactive "n 0 (transparent) - 100 (opaque): ")
  (set-frame-parameter (selected-frame) 'alpha value))

(defun echo (expr)
  "echo"
  (interactive "sExpr: ")
  (message (eval expr)))


(defmacro inc (var)
  ;; simple macro definition example
  (list 'setq var (list '+ 1 var)))

