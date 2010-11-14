;; plugins.el
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/plugins/"))
(require 'wb-line-number)               ; show line number in independent window
(require 'line-num)                     ; show line number in the same window

(require 'redo)                         ; need key mapping
(require 'run-guile)
(require 'rect-mark)

(require 'mercurial)
(require 'vc-hg)

;; (require 'folding)
(load "folding" 'nomessage 'noerror)    ;; these two line make all files
(folding-mode-add-find-file-hook)       ;; to be searched for folding marks
;; (require 'folding-isearch)

(require 'sr-speedbar)


(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/plugins/emacs-rails/"))
(require 'rails)
;; Depend on:
;;   snippet.el
;;   find-recursive.el

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/plugins/yasnippet-0.6.1c/"))
(require 'yasnippet)
(yas/initialize)


;; color theme plugin
(require 'color-theme)                  ; general color setting solution
(color-theme-initialize)

;; provide symbol
(provide 'plugins)
