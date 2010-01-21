;; binding.el
;;   Set all custom key binding here.
;;


;; FOR DEFINED IN etc/defun.el
(define-key global-map "\C-j" 'join-line-below)
(define-key ctl-x-map "j" 'join-line-below)
(define-key ctl-x-map "c" 'recompile-emacs.d)
;;(define-key global-map "\C-xk" 'kill-buffer-and-frame)


;; FOR CONVENNIENT
(define-key global-map "\M-!" 'eshell)
(define-key ctl-x-map "w" 'copy-region-as-kill)


;; FOR PLUGINS
;; (define-key global-map "\C-xl" 'wb-line-number-toggle)
(define-key ctl-x-map "l" 'wb-line-number-toggle)

(if window-system
    (define-key ctl-x-map "p" 'speedbar-get-focus)
    (define-key ctl-x-map "p" 'sr-speedbar-focus-toggle))


(global-unset-key [(control ?\/)])      ;; unset C-/
(global-set-key "\M-z" 'undo)
(global-set-key "\M-Z" 'redo)


;;
;; (define-key global-map "\M-RET" 'dired-find-file-other-window)


(provide 'binding)