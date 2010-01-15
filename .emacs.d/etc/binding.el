;; binding.el
;;   Set all global key binding here.
;;


;; FOR DEFINED IN etc/defun.el
(define-key global-map "\C-j" 'join-line-below)
;;(define-key global-map "\C-xk" 'kill-buffer-and-frame)

;; FOR CONVENNIENT
(define-key global-map "\M-!" 'eshell)

;; FOR PLUGINS
(define-key global-map "\C-xl" 'wb-line-number-toggle)
(global-set-key "\M-z" 'undo)
(global-set-key "\M-Z" 'redo)

;;
(define-key global-map "\M-RET" 'dired-find-file-other-window)