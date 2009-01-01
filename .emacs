;; === path and file loading ===
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))
(require 'ruby-mode)                    ; load ruby-mode.el from debian
(require 'wb-line-number)               ; wb-line-number plugin
(require 'color-theme)                  ; color-theme plugin
(require 'coding-pair)                  ; my config for insert () {} ..etc
(require 'shebang)
(require 'mac-frame)

;; === load git-emacs plugin ===
(add-to-list 'load-path (expand-file-name "~/.git-emacs"))
(require 'git-emacs)

;; === global variable setting ===
(setq auto-mode-alist 
      (append '(("\\.rb\\'" . ruby-mode) 
                ("\\.rake\\'" . ruby-mode)
                ("\\rakefile\\'" . ruby-mode)
                ("\\.org\\'" . org-mode)) 
              auto-mode-alist))

;; === simple face setting ===
(setq transient-mark-mode t                    ;;
      make-backup-files nil                    ;; not back up file into filename~
      delete-old-versions t                    ;; kill all filename~
      global-hl-line-mode t                    ;; highlight current line

      scroll-bar-mode nil                      ;; hidden scroll bar
      tool-bar-mode nil                        ;; hidden too bar
      menu-bar-mode nil                        ;; hidden menu bar

      mouse-wheel-mode nil                     ;; disable mouse scrolling
      column-number-mode t                     ;; show column number
      indent-tabs-mode nil                     ;; expand tab to set
      mac-option-modifier 'meta                ;; set mac option as meta
      line-number-mode t)

(set-face-attribute 'mode-line nil :box nil)
; (global-font-lock-mode t)

;; === my function ===
;; write my own emacs lisp function here
;; if the function block is too rge, move it to 

(defun join-line-below ()
  (interactive)
  (next-line)
  (join-line))

(defun kill-buffer-and-frame ()
  (interactive)
  (if (kill-buffer nil)
  (delete-frame)
  ()))

;; === remapping key ===
;; global mapping shortcut here
(define-key global-map "\C-j" 'join-line-below);; redefine key C-j from 'eval-print-last-sexp to 'join-line-below
(define-key global-map "\M-!" 'shell)          ;; redefine key M-! to 'shell
(define-key global-map "\C-xl" 'wb-line-number-toggle)
(define-key global-map "\C-xk" 'kill-buffer-and-frame)

;; === unclassify ===
(custom-set-variables
    '(tool-bar-mode nil nil (tool-bar))        ;; hidden tool-bar
    '(scroll-bar-mode nil nil (scroll-bar))    ;; hidden scroll-bar
    '(menu-bar-mode nil nil (menu-bar))        ;; hidden menu-bar
;    '(auto-save-mode nil)                     ;; forbidden auto-save
;    '(cua-mode t nil (cua-base))              ;; using C-x, C-c, C-v to cut, copy and paste
)


;; === final called function ===
;(wb-line-number-enable)
(color-theme-dark-laptop)
(custom-set-faces)
