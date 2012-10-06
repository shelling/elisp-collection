;; plugins.el
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/"))

(require 'redo)                         ; need key mapping
(require 'run-guile)
(require 'rect-mark)


(require 'vc-git)                  ;; emacs-git
(require 'snippet)                 ;; emacs-rails
(require 'find-recursive)          ;; emacs-rails
(require 'square-braces-as-parens) ;; run-guile
(require 'set-keys)                ;; run-guile
(require 'map-table)               ;; run-guile
(require 'sym-comp)                ;; python.el in emacs 22

(require 'mercurial)
(require 'vc-hg)

(require 'sr-speedbar)

(require 'highlight-parentheses)
(require 'autopair )

(require 'pod-mode)

(require 'folding)


;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/emacs-rails/"))
;; (require 'rails)
;; ;; Depend on:
;; ;;   snippet.el
;; ;;   find-recursive.el

(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/yasnippet-0.6.1c/"))
(require 'yasnippet)
(yas/initialize)


;; color theme plugin
(require 'color-theme)                  ; general color setting solution
(color-theme-initialize)
