;; binding.el
;;   Set all custom key binding here.
;;

;; for Carbon Emacs 22
(if (and (<= emacs-major-version 22) (eq window-system 'mac))
    (let ()
      (global-set-key [(meta return)] 'carbon-emacs-toggle-fullscreen)
      (define-key ctl-x-map "p" 'speedbar)
      )
  )

;; for Cocoa Emacs 23
(if (and (>= emacs-major-version 23) (eq window-system 'ns))
    (let ()
      (global-set-key [(meta return)] 'ns-toggle-fullscreen)
      )
  )

;; for emacs undef terminal
(if window-system
    ()
    (let ()
      (define-key ctl-x-map "p" 'sr-speedbar-focus-toggle)
    )
)


;; for defined in etc/defun.el
(define-key global-map "\C-j" 'join-line-below)
(define-key ctl-x-map "j" 'join-line-below)
(define-key ctl-x-map "c" 'recompile-emacs.d)


;; for convention
(define-key global-map "\M-!" 'eshell)



;; for plugins
;; (define-key global-map "\C-xl" 'wb-line-number-toggle)
(define-key ctl-x-map "l" 'wb-line-number-toggle)



(global-unset-key [(control ?\/)])      ;; unset C-/
(global-set-key [(super Z)] 'redo)
(global-set-key [(super z)] 'undo)


(provide 'binding)