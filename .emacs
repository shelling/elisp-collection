(package-initialize)

(prefer-coding-system 'utf-8) ;; use utf8 as default file encoding

(require 'cask (and (file-exists-p "~/.cask/cask.el") "~/.cask/cask.el"))
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
(autoload 'guru-mode        "guru-mode"           nil t)
(autoload 'rcirc "rcirc" nil t)
(autoload 'highlight-parentheses-mode
          "highlight-parentheses"
          "Minor mode to highlight the surrounding parentheses."
          t
          nil)

(add-hook 'after-init-hook
          'guru-global-mode)

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

(add-hook 'markdown-mode-hook
          'turn-on-auto-fill)

(defalias 'perl-mode 'cperl-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CUSTOMIZATION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'zenburn t)

(set-fontset-font "fontset-default" 'han '("LiHei_Pro" . "iso10646-1"))

(set-face-attribute
 'mode-line nil
 :box nil)

(custom-set-variables
 '(custom-safe-themes '("be7eadb2971d1057396c20e2eebaa08ec4bfd1efe9382c12917c6fe24352b7c1" default))
 '(package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                      ("marmalade" . "http://marmalade-repo.org/packages/")
                      ("melpa" . "http://melpa.milkbox.net/packages/")))
 '(Info-default-directory-list (append Info-default-directory-list '("~/.info")))
 '(Info-additional-directory-list '("~/.info"))
 '(initial-buffer-choice t)
 '(global-font-lock-mode t)
 '(auto-save-mode nil)                      ;; forbidden auto-save
 '(global-hl-line-mode t)                   ;; highlight current line
 '(delete-old-versions t)                   ;; kill all filename~
 '(make-backup-files nil)                   ;; not back up file into filename~
 '(completion-ignore-case t)
 '(default-fill-column 80)
 '(fill-column 80)
 '(show-paren-mode t)
 '(autopair-global-mode t)

 '(lazy-frame-json "~/.lazy-frame.json")

 '(yas-snippet-dirs (cons "~/.snippets" ;; construct from original value
                          (eval (car (get 'yas-snippet-dirs 'standard-value)))))

 '(default-frame-alist (frame-setting-read))
 '(initial-frame-alist (frame-setting-read))

 '(face-font-rescale-alist '((".*LiHei_Pro.*" . 1.10)))

 '(ibus-cursor-color '("#4EA4D9" "#EB6528" "#C9DE55"))

 '(split-height-threshold 30)               ;;
 '(split-width-threshold 60)                ;;

 '(column-number-mode t)                    ;; show column number
 '(line-number-mode t)                      ;; show line number

 '(tool-bar-mode nil nil (tool-bar))        ;; hidden tool-bar
 '(scroll-bar-mode nil nil (scroll-bar))    ;; hidden scroll-bar
 '(menu-bar-mode nil nil (menu-bar))        ;; hidden menu-bar
 '(transient-mark-mode t)                   ;; highlight marked region
 '(ring-bell-function 'ignore)              ;; turn the alarm totally off

 '(ido-mode t)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)

 '(cperl-indent-level 2)
 '(cperl-hairy nil)
 '(cperl-electric-parens nil)
 '(cperl-electric-keywords nil)
 '(cperl-indent-parens-as-block t)
 '(cperl-close-paren-offset -4)

 '(ruby-indent-level 2)

 '(scss-compile-at-save nil)

 '(haml-indent-offset 4)

 '(puppet-indent-level 2)

 '(sgml-basic-offset 4)                     ;; for html-mode

 '(indent-tabs-mode nil)                    ;; expand tab to set
 '(default-tab-width 4)                     ;; tab as 4 space

 '(sr-speedbar-right-side nil)
 '(speedbar-show-unknown-files t)
 '(truncate-lines t)

 '(rcirc-server-alist
   '(("irc.freenode.net"
      :channels
      ("#emacs"
       "#chupei.pm"
       "#shelling"
       "#g0v.tw"
       "#perl.tw"
       "#haskell"
       "#pegex"
       "#bpan"
       "#osdc.tw"
       "#dot"))))
 '(rcirc-default-nick "shelling_emacs")
 '(rcirc-default-full-name "shelling ford")

 ;; '(cua-mode t nil (cua-base))               ;; using C-x, C-c, C-v to cut, copy and paste
 '(mac-option-modifier 'meta)               ;; set mac option as meta
 '(mac-command-modifier 'super))

(custom-set-faces)

(require 'load-recursive)
(let ((local-lib "~/projects/local.el"))
  (if (file-exists-p local-lib)
      (recursive-load local-lib)))

(cd "~")
