;; custom.el
;;

(custom-set-variables
    '(package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

    '(yas/root-directory "~/.yasnippets" nil (yasnippet))
    '(Info-default-directory-list (append Info-default-directory-list '("~/.info")))
    '(auto-save-mode nil)                      ;; forbidden auto-save
    '(global-hl-line-mode t)                   ;; highlight current line
    '(delete-old-versions t)                   ;; kill all filename~
    '(make-backup-files nil)                   ;; not back up file into filename~
    '(completion-ignore-case t)
    '(default-fill-column 120)
    '(show-paren-mode t)

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

    '(cperl-indent-level 4)
    '(cperl-hairy nil)
    '(cperl-electric-parens t)
    '(cperl-electric-keywords nil)
    '(cperl-indent-parens-as-block t)
    '(cperl-close-paren-offset -4)

    '(ruby-indent-level 4)

    '(scss-compile-at-save nil)

    '(haml-indent-offset 4)

    '(puppet-indent-level 4)

    '(indent-tabs-mode nil)                    ;; expand tab to set
    '(default-tab-width 4)                     ;; tab as 4 space
    ;; '(cua-mode t nil (cua-base))               ;; using C-x, C-c, C-v to cut, copy and paste
    '(mac-option-modifier 'meta)               ;; set mac option as meta
    '(mac-command-modifier 'super))

(set-face-attribute 'mode-line nil :box nil)
;; (global-font-lock-mode t)

(custom-set-faces)

(setq-default speedbar-show-unknown-files t
              truncate-lines              t
              sr-speedbar-right-side      nil)

(setq
 rcirc-default-nick              "shelling_emacs"
 rcirc-default-full-name         "shelling ford"
 rcirc-server-alist              '(
                                   ("irc.freenode.net" :channels ("#emacs" "#chupei.pm" "#shelling" "#perl.tw" "#dot"))
                                   )
 )


(defvar frame-setting '())
;; for Carbon Emacs 22
(if (and (<= emacs-major-version 22) (eq window-system 'mac))
    (setq frame-setting
      '(
        (top . 26)
        (left . 350)
        (width . 120)
        (height . 53)
        (alpha . (90 90))
        )))

;; for Cocoa Emacs 23
(if (and (>= emacs-major-version 23) (eq window-system 'ns))
    (progn
      (if (string-match "i386-apple-darwin" system-configuration)
          (setq frame-setting
            '(
              (font . "-apple-Monaco-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")
              (left . 140)
              (width . 120)
              (height . 42)
              (alpha . (90 90))
              )))
      (if (string-match "x86_64-apple-darwin" system-configuration)
          (setq frame-setting
            '(
              (font . "-apple-Monaco-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")
              (left . 140)
              (top . 50)
              (width . 120)
              (height . 40)
              (alpha . (95 95))
              )))

      (set-fontset-font "fontset-default" 'han '("LiHei_Pro" . "iso10646-1"))
      (setq face-font-rescale-alist '((".*LiHei_Pro.*" . 1.10)))

      )
)

;; for Linux
(if (eq window-system 'x)
    (let ()
     (setq frame-setting
      '(
        (top . 50)
        (left . 30)
        (width . 120)
        (height . 45)
        (alpha . (90 90))
        (font . "Monospace-12")
        ))

     (require 'ibus)
     (add-hook 'after-init-hook 'ibus-mode-on)
     ;; (setq ibus-agent-file-name "/usr/lib/ibus-el/ibus-el/agent")
     (setq ibus-cursor-color '("#4EA4D9" "#EB6528" "#C9DE55"))
     (global-set-key (kbd "M-SPC") 'ibus-toggle)
     ) 
  )

(if frame-setting
    (let ()
      (setq default-frame-alist frame-setting
            initial-frame-alist frame-setting)
      ))

(defalias 'perl-mode 'cperl-mode)

(prefer-coding-system 'utf-8)           ;; use utf8 as default file encoding

(add-hook 'emacs-lisp-mode-hook
          'highlight-parentheses-mode)



(color-theme-railscasts)
