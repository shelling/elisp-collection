;; binding.el
;;   Set all custom key binding here.
;;

(global-unset-key [(ctrl ?\/)])      ;; unset C-/


;; global convention
(global-set-key [(super Z)] 'redo)
(global-set-key [(super z)] 'undo)

(global-set-key "\M-[" 'previous-multiframe-window)
(global-set-key "\M-]" 'next-multiframe-window)

(global-set-key "\M-!" 'eshell)

(define-key ctl-x-map "l" 'global-linum-mode)

(define-key ctl-x-map "j" 'join-line-below)

(define-key ctl-x-map "c" 'recompile-emacs.d)

;; rectangle region editing
(global-set-key (kbd "C-x r C-SPC")
                'rm-set-mark)
(global-set-key (kbd "C-x r C-x")
                'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w")
                'rm-kill-region)
(global-set-key (kbd "C-x r M-w")
                'rm-kill-ring-save)
(global-set-key (kbd "C-x r r")
                'replace-rectangle)

;; window resizing 
(global-set-key (kbd "S-C-<left>")
                'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>")
                'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>")
                'shrink-window)
(global-set-key (kbd "S-C-<up>")
                'enlarge-window)

;; for Carbon Emacs 22
(if (and (<= emacs-major-version 22) (eq window-system 'mac))
    (progn
      (global-set-key [(meta return)] 'carbon-emacs-toggle-fullscreen)
      )
  )

;; for Cocoa Emacs 23
(if (and (>= emacs-major-version 23) (eq window-system 'ns))
    (progn
      (global-set-key [(meta return)] 'ns-toggle-fullscreen)
      )
  )

;; for emacs undef terminal
(if window-system
    ()
    (progn
      (define-key ctl-x-map "p" 'sr-speedbar-focus-toggle)
    )
)
