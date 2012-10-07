;; plugins.el
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/"))

(require 'redo)                         ; need key mapping

(autoload 'rm-set-mark "rect-mark" "" t nil)

(require 'mercurial)
(require 'vc-hg)

(require 'sr-speedbar)

(require 'autopair)

(require 'pod-mode)

(require 'folding)


(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/yasnippet-0.6.1c/"))
(require 'yasnippet)
(yas/initialize)


;; color theme plugin
(require 'color-theme)                  ; general color setting solution
(color-theme-initialize)
