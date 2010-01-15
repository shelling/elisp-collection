;; __LOAD_CONFIGURE__
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))
(require 'convention)                   ;; personal conventional interactive function
(require 'mode)                         ;; major and minor mode
(require 'vendor)                       ;; third party library
(require 'patch)                        ;; personal patch for third party plugins
(require 'etc)                          ;; personal setting

;; __LOAD_CONFIGURE__
;; __END__ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; __PARTIAL_CUSTOM__
(custom-set-variables
    '(tool-bar-mode nil nil (tool-bar))        ;; hidden tool-bar
    '(scroll-bar-mode nil nil (scroll-bar))    ;; hidden scroll-bar
    '(menu-bar-mode nil nil (menu-bar))        ;; hidden menu-bar
    '(transient-mark-mode t)                   ;; highlight marked region
    '(ring-bell-function 'ignore)              ;; turn the alarm totally off
)
;; __PARTIAL_CUSTOM__
;; __END__ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; __CALL_COLOR_THEME__
(color-theme-initialize)

;; (color-theme-dark-laptop)
(color-theme-railscasts)
;; (color-theme-blackboard)
;; (color-theme-charcoal-black)
;; (color-theme-deep-blue)
;; (color-theme-gnome2)
;; (color-theme-kingsajz)

;; __CALL_COLOR_THEME__
;; __END__ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
