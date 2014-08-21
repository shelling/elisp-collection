(package-initialize)

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

(require 'guru-mode)
(add-hook 'after-init-hook 'guru-global-mode)

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
(global-set-key (kbd "M-k")             'backward-kill-line)
(global-set-key (kbd "C-x j")           'join-line-below)

;; alignment
(global-set-key (kbd "C-x a a")         'align)
(global-set-key (kbd "C-x a c")         'align-current)
(global-set-key (kbd "C-x a r")         'align-regexp)

(global-set-key (kbd "C-x p")           'sr-speedbar-focus-toggle)
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
       '(("scheme"                   . scheme-mode)
         ("osascript"                . applescript-mode)
         ("node"                     . javascript-mode)
         ("erl"                      . erlang-mode)))

(defun load-all (name)
  (let ((type (car (file-attributes name))))
    (cond 
     ;; is file
     ((eq type nil) 
      (load 
       (file-name-nondirectory (replace-regexp-in-string "\\.el$" "" name))))
     ;; is dir
     ((eq type t)
      (progn 
        (add-to-list 'load-path (expand-file-name name))
        (loop for file in-ref (directory-files name)
              do 
              (if (and (not (string= ".." file)) 
                       (not (string= "." file)))
                  (load-all (concat (file-name-as-directory name) file))))))
     ;; is symlink
     (t (load-all type))
     )))

(load-all "~/.emacs.d/etc")

(cd "~")
