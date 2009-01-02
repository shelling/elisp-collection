;; === path and file loading ===
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))

;; === third part plugins ===
(require 'ruby-mode)                    ; load ruby-mode.el from debian
(require 'wb-line-number)               ; wb-line-number plugin
(require 'color-theme)                  ; color-theme plugin
(require 'css-mode)

;; === my configure ===
(require 'coding-pair)
(require 'shebang)
(require 'mac-frame)

;; === major mode confiure ===
(setq auto-mode-alist 
      (append '(("\\.rb\\'" . ruby-mode) 
                ("\\.rake\\'" . ruby-mode)
                ("\\rakefile\\'" . ruby-mode)
                ("\\.org\\'" . org-mode)
		("\\.css\\'" . css-mode))
              auto-mode-alist))

;; === simple face setting ===
(setq transient-mark-mode t                    ;; highlight marked region
      make-backup-files nil                    ;; not back up file into filename~
;;       mouse-wheel-mode nil                     ;; disable mouse scrolling
      column-number-mode t                     ;; show column number
      indent-tabs-mode nil                     ;; expand tab to set
      mac-option-modifier 'meta                ;; set mac option as meta
      line-number-mode t)


(set-face-attribute 'mode-line nil :box nil)
;; (global-font-lock-mode t)

;; === my function ===
(defun join-line-below ()
  (interactive)
  (next-line)
  (join-line))
(define-key global-map "\C-j" 'join-line-below)

(defun kill-buffer-and-frame ()
  (interactive)
  (if (kill-buffer nil)
      (delete-frame)
      ()))
(define-key global-map "\C-xk" 'kill-buffer-and-frame)

;; === remapping key ===
(define-key global-map "\M-!" 'shell)          ;; redefine key M-! to 'shell
(define-key global-map "\C-xl" 'wb-line-number-toggle)

;; === unclassify ===
(custom-set-variables
    '(tool-bar-mode nil nil (tool-bar))        ;; hidden tool-bar
    '(scroll-bar-mode nil nil (scroll-bar))    ;; hidden scroll-bar
    '(menu-bar-mode nil nil (menu-bar))        ;; hidden menu-bar
    '(auto-save-mode nil)                      ;; forbidden auto-save
    '(global-hl-line-mode t)                   ;; highlight current line
    '(delete-old-versions Delete)              ;; kill all filename~
;;     '(cua-mode t nil (cua-base))               ;; using C-x, C-c, C-v to cut, copy and paste
)

;; === final called function ===
;; (wb-line-number-enable)
(custom-set-faces)
(color-theme-dark-laptop)
;; (color-theme-charcoal-black)

