;; deps.el
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/deps/"))

(require 'vc-git)                  ;; emacs-git
(require 'snippet)                 ;; emacs-rails
(require 'find-recursive)          ;; emacs-rails
(require 'square-braces-as-parens) ;; run-guile
(require 'set-keys)                ;; run-guile
(require 'map-table)               ;; run-guile

;; provide symbol
(provide 'deps)
