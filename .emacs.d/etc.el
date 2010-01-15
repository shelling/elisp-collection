;; etc.el
;;   Load all file in ~/.emacs.d/etc/
;;

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/etc/"))

(load-file "~/.emacs.d/etc/custom.el")  ;; personal setting
(load-file "~/.emacs.d/etc/defun.el")   ;; misc personal function
(load-file "~/.emacs.d/etc/binding.el") ;; keybinding
(load-file "~/.emacs.d/etc/auto-mode.el") ;; more relationshup between extensions filename and major mode


;; provide symbol
(provide 'etc)
