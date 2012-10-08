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
                ("\\.md$" . markdown-mode)
                ("\\.markdown$" . markdown-mode)
                ("\\.pp$" . puppet-mode)
                ("\\.pod$" . pod-mode)
                ("\\.t$" . cperl-mode)
                ("\\.scss$" . scss-mode)
                ("\\.haml$" . haml-mode)
                ("\\.p[lm]\\'" . cperl-mode))
              auto-mode-alist))

(nconc interpreter-mode-alist
       '(("scheme" . scheme-mode)
         ("osascript" . applescript-mode)
         ("erl" . erlang-mode)))
