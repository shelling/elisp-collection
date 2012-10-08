;; plugins.el
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/"))

(require 'redo+)                         ; need key mapping

(autoload 'rm-set-mark "rect-mark" "" t nil)


(require 'sr-speedbar)

(require 'autopair)

(require 'pod-mode)

(require 'folding)
