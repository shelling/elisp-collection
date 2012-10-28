;; mode.el
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/mode/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/mode/rhtml-mode/"))

;;        'function         "file"                doc interactive   type(nil, keymap, macro)
(autoload 'cperl-mode       "cperl-mode"          nil t)
(autoload 'sgml-mode        "sgml-mode"           nil t)
(autoload 'applescript-mode "applescript-mode"    nil t)
(autoload 'erlang-mode      "erlang"              nil t)
(autoload 'yaml-mode        "yaml-mode"           nil t)
(autoload 'ruby-mode        "ruby-mode"           nil t)
(autoload 'rhtml-mode       "rhtml-mode"          nil t)
(autoload 'puppet-mode      "puppet-mode"         nil t)
(autoload 'scss-mode        "scss-mode"           nil t)
(autoload 'haml-mode        "haml-mode"           nil t)

(setq auto-mode-alist
      (append '(("\\.rb\\'"          . ruby-mode)
                ("\\.rake$"          . ruby-mode)
                ("Gemfile$"          . ruby-mode)
                ("Capfile$"          . ruby-mode)
                ("\\.builder$"       . ruby-mode)
                ("\\rakefile\\'"     . ruby-mode)
                ("\\.rhtml\\'"       . rhtml-mode)
                ("\\.erb\\'"         . rhtml-mode)
                ("\\.org\\'"         . org-mode)
                ("\\.js$"            . javascript-mode)
                ("\\.bash\\\\'"      . shell-script-mode)
                ("\\.applescript$"   . applescript-mode)
                ("\\.md$"            . markdown-mode)
                ("\\.markdown$"      . markdown-mode)
                ("\\.pp$"            . puppet-mode)
                ("\\.pod$"           . pod-mode)
                ("\\.t$"             . cperl-mode)
                ("\\.p[lm]\\'"       . cperl-mode))
              auto-mode-alist))

(nconc interpreter-mode-alist
       '(("scheme" . scheme-mode)
         ("osascript" . applescript-mode)
         ("erl" . erlang-mode)))
