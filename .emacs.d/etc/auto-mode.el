;; auto-mode.el
;;

(setq auto-mode-alist
      (append '(("\\.rb\\'" . ruby-mode)
                ("\\.rake$" . ruby-mode)
                ("Gemfile$" . ruby-mode)
                ("Capfile$" . ruby-mode)
                ("\\.builder$" . ruby-mode)
                ("\\rakefile\\'" . ruby-mode)
                ("\\.rhtml\\'" . rhtml-mode)
                ("\\.erb\\'" . rhtml-mode)
                ("\\.org\\'" . org-mode)
                ("\\.yml\\'" . yaml-mode)
                ("\\.yaml\\'" . yaml-mode)
                ("\\.js$" . javascript-mode)
                ("\\.bash\\\\'" . shell-script-mode)
                ("\\.css\\'" . css-mode)
                ("\\.applescript$" . applescript-mode)
                ("\\.pod$" . pod-mode)
                ("\\.p[lm]\\'" . cperl-mode))
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
         ("osascript" . applescript-mode)
;;          ("perl" . cperl-mode)
         ("erl" . erlang-mode)))
