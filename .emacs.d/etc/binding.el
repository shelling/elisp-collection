;; binding.el
;;   Set all custom key binding here.
;;

(global-unset-key (kbd "C-/"))       ;; unset C-/
(global-unset-key (kbd "C-_"))       ;; unset C-_

;; global convention
(global-set-key (kbd "s-Z")             'redo)
(global-set-key (kbd "s-z")             'undo)

;; windows jumping
(global-set-key (kbd "M-[")             'previous-multiframe-window)
(global-set-key (kbd "M-]")             'next-multiframe-window)

;; line manipulating
(global-set-key (kbd "M-k")             'backward-kill-line)
(global-set-key (kbd "C-x j")           'join-line-below)

(global-set-key (kbd "C-x p")           'sr-speedbar-focus-toggle)

(global-set-key (kbd "C-x a a")         'align)
(global-set-key (kbd "C-x a c")         'align-current)
(global-set-key (kbd "C-x a r")         'align-regexp)

(global-set-key (kbd "C-c TAB")         'folding-toggle-show-hide)
(global-set-key (kbd "M-!")             'eshell)

(global-set-key (kbd "C-x l")           'global-linum-mode)
(global-set-key (kbd "C-x c")           'recompile-emacs.d)

;; rectangle region editing
(global-set-key (kbd "C-x r C-SPC")     'rm-set-mark)
(global-set-key (kbd "C-x r C-x")       'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w")       'rm-kill-region)
(global-set-key (kbd "C-x r M-w")       'rm-kill-ring-save)
(global-set-key (kbd "C-x r r")         'replace-rectangle)

;; window resizing
(global-set-key (kbd "S-C-<left>")      'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>")     'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>")      'shrink-window)
(global-set-key (kbd "S-C-<up>")        'enlarge-window)

;; for Cocoa Emacs 23
(if (and (>= emacs-major-version 23) (eq window-system 'ns))
    (progn
      (global-set-key [(meta return)] 'ns-toggle-fullscreen)
      )
  )

