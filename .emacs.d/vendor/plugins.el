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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; temporary obsolete plugins    ;;
;; unmask section to reboot them ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (require 'elisp-cache)
;; ;; not yet set the cache direcotry
;; ;; not a convenient plugin

;; (require 'byte-code-cache)
;; ;; should be loaded before other plugin to compile them
;; ;; not a convenient plugin

;; provide symbol
(provide 'plugins)
