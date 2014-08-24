;; custom.el
;;

(custom-set-variables
    '(custom-safe-themes '("be7eadb2971d1057396c20e2eebaa08ec4bfd1efe9382c12917c6fe24352b7c1" default))
    '(package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
    '(Info-default-directory-list (append Info-default-directory-list '("~/.info")))
    '(initial-buffer-choice t)
    '(global-font-lock-mode t)
    '(auto-save-mode nil)                      ;; forbidden auto-save
    '(global-hl-line-mode t)                   ;; highlight current line
    '(delete-old-versions t)                   ;; kill all filename~
    '(make-backup-files nil)                   ;; not back up file into filename~
    '(completion-ignore-case t)
    '(default-fill-column 120)
    '(show-paren-mode t)
    '(autopair-global-mode t)

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

(set-face-attribute 'mode-line nil :box nil)
(set-fontset-font "fontset-default" 'han '("LiHei_Pro" . "iso10646-1"))
(custom-set-faces)

(load-theme 'zenburn t)
