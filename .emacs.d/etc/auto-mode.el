;; auto-mode.el
;;

(setq auto-mode-alist
      (append '(("\\.rb\\'" . ruby-mode)
                ("\\.rake\\'" . ruby-mode)
                ("\\rakefile\\'" . ruby-mode)
                ("\\.rhtml\\'" . rhtml-mode)
                ("\\.erb\\'" . rhtml-mode)
                ("\\.org\\'" . org-mode)
                ("\\.yml\\'" . yaml-mode)
                ("\\.yaml\\'" . yaml-mode)
                ("\\.js$" . javascript-mode)
                ("\\.bash\\\\'" . shell-script-mode)
                ("\\.css\\'" . css-mode)
                ("\\.pm\\'" . cperl-mode)
                ("\\.pl\\'" . cperl-mode))
              auto-mode-alist))

(add-to-list 'interpreter-mode-alist
             '("perl" . cperl-mode))

;; (setq interpreter-mode-alist
;;       (append '(("scheme" . scheme-mode)
;;                 ("guile" . scheme-mode))
;;               interpreter-mode-alist))

(nconc interpreter-mode-alist
       '(("scheme" . scheme-mode)
         ("guile" . scheme-mode)
         ("ruby" . ruby-mode)
;;          ("perl" . cperl-mode)
         ("erl" . erlang-mode)))

(provide 'auto-mode)