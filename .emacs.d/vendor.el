;; vendor.el

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/"))

(require 'deps)            ;; should be require before loading plugins
(require 'plugins)

;; provide symbol
(provide 'vendor)

