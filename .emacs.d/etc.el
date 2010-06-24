;; etc.el
;;   Load all file in ~/.emacs.d/etc/
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/etc/"))

(require 'self-custom);; personal setting
(require 'defun)      ;; misc personal function
(require 'binding)    ;; keybinding
(require 'auto-mode)  ;; more relationshup between extensions filename and major mode

;; provide symbol
(provide 'etc)
