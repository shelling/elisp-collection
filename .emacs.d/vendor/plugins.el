;; plugins.el
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/plugins/"))
(require 'wb-line-number)               ; show line number in independent window
(require 'line-num)                     ; show line number in the same window
(require 'color-theme)                  ; general color setting solution
(require 'redo)                         ; need key mapping

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/plugins/emacs-rails"))
(require 'rails)                        ; rails integrate environment
;; Depend on:
;;   snippet.el
;;   find-recursive.el

(require 'run-guile)

(require 'mercurial)
(require 'vc-hg)

(require 'rect-mark)

(require 'folding)
;; (require 'folding-isearch)

;; provide symbol
(provide 'plugins)
