; === path and file loading ===
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))
(require 'ruby-mode)                    ; load ruby-mode.el from debian
(require 'wb-line-number)               ; wb-line-number plugin
(require 'color-theme)                  ; color-theme plugin
(require 'coding-pair)                  ; my config for insert () {} ..etc
(require 'shebang)


; === load git-emacs plugin ===
(add-to-list 'load-path (expand-file-name "~/.git-emacs"))
(require 'git-emacs)

; === global variable setting ===
(setq frame-default-height 36)
(setq frame-default-width 120)

(setq auto-mode-alist 
      (append '(("\\.rb\\'" . ruby-mode) 
                ("\\.rake\\'" . ruby-mode)
                ("\\rakefile\\'" . ruby-mode)
                ("\\.org\\'" . org-mode)) 
              auto-mode-alist))

; === simple face setting ===
;(scroll-bar-mode nil)                   ; hidden scroll bar
;(menu-bar-mode nil)                     ; hidden menu bar
(mouse-wheel-mode nil)                  ; disable mouse scrolling
(column-number-mode t)                  ; show column number
(global-hl-line-mode t)                 ; highlight current line
(set-face-attribute 'mode-line nil :box nil)
; (global-font-lock-mode t)
(setq default-frame-alist '((width . 120) (height . 36)))

; === simple editing setting ===
(setq-default indent-tabs-mode nil)     ; expand tab to set
(setq mac-option-modifier 'meta)        ; set mac option as meta

; === my function ===
;;;;; write my own emacs lisp function here
;;;;; if the function block is too rge, move it to 
(defun mac-frame-max ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 
    (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

(defun mac-frame-default ()
  (interactive)
  (set-frame-height nil frame-default-height)
  (set-frame-width nil frame-default-width))

(defun join-line-below ()
  (interactive)
  (next-line)
  (join-line))

(defun kill-buffer-and-frame ()
  (interactive)
  (if (kill-buffer nil)
  (delete-frame)
  ()))

; === remapping key ===
;;;;; global mapping shortcut here
(define-key global-map "\C-j" 'join-line-below);; redefine key C-j from 'eval-print-last-sexp to 'join-line-below
(define-key global-map "\M-!" 'shell)          ;; redefine key M-! to 'shell
(define-key global-map "\C-xl" 'wb-line-number-toggle)
(define-key global-map "\C-xk" 'kill-buffer-and-frame)

; === unclassify ===
;;;;; undefined 
(setq transient-mark-mode t)

(custom-set-variables
    '(tool-bar-mode nil nil (tool-bar))        ;; hidden x-window tool-bar
    '(scroll-bar-mode nil nil (scroll-bar))    ;; hidden x-window scroll-bar
;    '(auto-save-mode nil)
;    '(cua-mode t nil (cua-base))
)


; === final called function ===
;;;;; all appended function from plugin should be called here.
;(wb-line-number-enable)
(color-theme-dark-laptop)
(mac-frame-default)
(custom-set-faces)
