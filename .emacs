(package-initialize)

(prefer-coding-system 'utf-8) ;; use utf8 as default file encoding

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'cl)

(require 'yasnippet)
(yas-global-mode 1)

(require 'redo+)                         ; need key mapping
(require 'rect-mark)
(require 'sr-speedbar)
(require 'autopair)
(require 'pairs)
(require 'lazy-frame)

(require 'guru-mode)
(add-hook 'after-init-hook 'guru-global-mode)

(when (require 'ibus nil :noerror)
  (add-hook 'after-init-hook 'ibus-mode-on)
  (global-set-key (kbd "M-SPC") 'ibus-toggle))

;; BINDING SETTINGS

(global-unset-key (kbd "C-/"))       ;; unset C-/
(global-unset-key (kbd "C-_"))       ;; unset C-_

;; redo/undo
(global-set-key (kbd "s-Z")             'redo)
(global-set-key (kbd "s-z")             'undo)

;; windows jumping
(global-set-key (kbd "M-[")             'previous-multiframe-window)
(global-set-key (kbd "M-]")             'next-multiframe-window)

;; line manipulating
(global-set-key
 (kbd "M-k") ;; backward kill line
 '(lambda ()
    (interactive)
    (kill-line 0)))

(global-set-key
 (kbd "C-x j") ;; join line below
 '(lambda ()
    (interactive)
    (next-line)
    (join-line)))

;; alignment
(global-set-key (kbd "C-x a a")         'align)
(global-set-key (kbd "C-x a c")         'align-current)
(global-set-key (kbd "C-x a r")         'align-regexp)

(global-set-key
 (kbd "C-x p") ;; sr-speedbar focus toggle
 '(lambda ()
    (interactive)
    (if (sr-speedbar-exist-p)
        (sr-speedbar-close)
      (sr-speedbar-open))
    (if (sr-speedbar-exist-p)
        (sr-speedbar-select-window)
      nil)))

(global-set-key (kbd "C-x l")           'global-linum-mode)
(global-set-key (kbd "C-x c")           'recompile-emacs.d)

(global-set-key (kbd "C-c TAB")         'folding-toggle-show-hide)
(global-set-key (kbd "M-!")             'eshell)

;; rectangle region editing
(global-set-key (kbd "C-x r C-SPC")     'rm-set-mark)
(global-set-key (kbd "C-x r C-x")       'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w")       'rm-kill-region)
(global-set-key (kbd "C-x r M-w")       'rm-kill-ring-save)
(global-set-key (kbd "C-x r r")         'replace-rectangle)

;; window resizing
(global-set-key (kbd "S-C-<left>")      'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>")     'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>")      'shrink-window)
(global-set-key (kbd "S-C-<up>")        'enlarge-window)

;; MODE SETTINGS

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
(autoload 'rcirc "rcirc" nil t)
(autoload 'highlight-parentheses-mode
          "highlight-parentheses"
          "Minor mode to highlight the surrounding parentheses."
          t
          nil)

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
                ("Cask"              . emacs-lisp-mode)
                ("\\.pod$"           . pod-mode)
                ("\\.t$"             . cperl-mode)
                ("\\.p[lm]\\'"       . cperl-mode))
              auto-mode-alist))

(nconc interpreter-mode-alist
       '(("scheme"                   . scheme-mode)
         ("osascript"                . applescript-mode)
         ("node"                     . javascript-mode)
         ("erl"                      . erlang-mode)))

(add-hook 'emacs-lisp-mode-hook
          'highlight-parentheses-mode)

(defalias 'perl-mode 'cperl-mode)

(require 'load-recursive)
(recursive-load "~/.emacs.d/etc")

(cd "~")
