;; etc.el
;;   Load all file in ~/.emacs.d/etc/
;;

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/etc/"))

(require 'self-custom);; personal setting
(require 'defun)      ;; misc personal function
(require 'binding)    ;; keybinding
(require 'auto-mode)  ;; more relationshup between extensions filename and major mode

;; (load-file "~/.emacs.d/etc/custom.el")
;; (load-file "~/.emacs.d/etc/defun.el")
;; (load-file "~/.emacs.d/etc/binding.el")
;; (load-file "~/.emacs.d/etc/auto-mode.el")

;; provide symbol
(provide 'etc)
