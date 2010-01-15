;; auto-mode.el
;;

(setq auto-mode-alist
      (append '(("\\.rb\\'" . ruby-mode)
                ("\\.rake\\'" . ruby-mode)
                ("\\rakefile\\'" . ruby-mode)
                ("\\.org\\'" . org-mode)
                ("\\.yml\\'" . yaml-mode)
                ("\\.yaml\\'" . yaml-mode)
                ("\\.js$" . javascript-mode)
                ("\\.bash\\\\'" . shell-script-mode)
                ("\\.css\\'" . css-mode)
                ("\\.pl\\'" . cperl-mode))
              auto-mode-alist))
