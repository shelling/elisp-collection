(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))
(require 'convention)                   ;; personal conventional interactive function
(require 'mode)                         ;; major and minor mode
(require 'vendor)                       ;; third party library
(require 'patch)                        ;; personal patch for third party plugins
(require 'etc)                          ;; personal setting




(custom-set-variables
    '(tool-bar-mode nil nil (tool-bar))        ;; hidden tool-bar
    '(scroll-bar-mode nil nil (scroll-bar))    ;; hidden scroll-bar
    '(menu-bar-mode nil nil (menu-bar))        ;; hidden menu-bar
    '(transient-mark-mode t)                   ;; highlight marked region
    '(ring-bell-function 'ignore))             ;; turn the alarm totally off
(custom-set-faces)



;; (color-theme-dark-laptop)
(color-theme-railscasts)
;; (color-theme-blackboard)
;; (color-theme-charcoal-black)
;; (color-theme-deep-blue)
;; (color-theme-gnome2)
;; (color-theme-kingsajz)

(speedbar t)


(byte-compile-file (expand-file-name "~/.emacs"))
(recompile-emacs.d)
