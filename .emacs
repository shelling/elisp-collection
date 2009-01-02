;; === path and file loading ===
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))

;; === single file, third part plugins ===
(require 'vc-git)
(require 'wb-line-number)               ; wb-line-number plugin
(require 'color-theme)                  ; color-theme plugin
(require 'css-mode)
(require 'javascript-mode)

;; === my configure ===
(add-to-list 'load-path (expand-file-name "~/.emacs.d/shelling/"))
(require 'coding-pair)
(require 'shebang)
(require 'mac-frame)

;; === require ruby-mode relative file ===
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ruby-mode/"))
(require 'ruby-mode)                    ; load ruby-mode.el from http://svn.ruby-lang.org/repos/ruby/trunk/misc/
(require 'ruby-electric)
(require 'inf-ruby)
(require 'ruby-style)

;; === require yaml-mode ===
(add-to-list 'load-path (expand-file-name "~/.emacs.d/yaml-mode/"))
(require 'yaml-mode)


;; === emacs-rails plugin ===
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-rails-deps"))
(require 'emacs-rails-deps)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-rails"))
(require 'rails)

;; === major mode confiure ===
(setq auto-mode-alist
      (append '(("\\.rb\\'" . ruby-mode)
                ("\\.rake\\'" . ruby-mode)
                ("\\rakefile\\'" . ruby-mode)
                ("\\.org\\'" . org-mode)
                ("\\.yml\\'" . yaml-mode)
                ("\\.yaml\\'" . yaml-mode)
                ("\\.js$" . javascript-mode)
                ("\\.bash\\\\'" . shell-script-mode)
                ("\\.css\\'" . css-mode))
              auto-mode-alist))

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
;; (define-key global-map "\C-xk" 'kill-buffer-and-frame)

;; === remapping key ===
(define-key global-map "\M-!" 'shell)          ;; redefine key M-! to 'shell
(define-key global-map "\C-xl" 'wb-line-number-toggle)

;; === customize emacs interface ===
(custom-set-variables
    '(tool-bar-mode nil nil (tool-bar))        ;; hidden tool-bar
    '(scroll-bar-mode nil nil (scroll-bar))    ;; hidden scroll-bar
    '(menu-bar-mode nil nil (menu-bar))        ;; hidden menu-bar
    '(transient-mark-mode t)                   ;; highlight marked region

    '(auto-save-mode nil)                      ;; forbidden auto-save
    '(global-hl-line-mode t)                   ;; highlight current line
    '(delete-old-versions Delete)              ;; kill all filename~
    '(make-backup-files nil)                   ;; not back up file into filename~

    '(column-number-mode t)                    ;; show column number
    '(line-number-mode t)
    '(indent-tabs-mode nil)                    ;; expand tab to set
    '(mac-option-modifier 'meta)               ;; set mac option as meta
;;     '(cua-mode t nil (cua-base))               ;; using C-x, C-c, C-v to cut, copy and paste
)
(set-face-attribute 'mode-line nil :box nil)
;; (global-font-lock-mode t)

;; === final called function ===
;; (wb-line-number-enable)
(custom-set-faces)
(color-theme-dark-laptop)
;; (color-theme-charcoal-black)

