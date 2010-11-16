;; custom.el
;;

(custom-set-variables
    '(yas/root-directory "~/.yasnippets" nil (yasnippet))
    '(Info-default-directory-list (append Info-default-directory-list '("~/.info")))
    '(auto-save-mode nil)                      ;; forbidden auto-save
    '(global-hl-line-mode t)                   ;; highlight current line
    '(delete-old-versions Delete)              ;; kill all filename~
    '(make-backup-files nil)                   ;; not back up file into filename~
    '(completion-ignore-case t)
    '(default-fill-column 120)

    '(column-number-mode t)                    ;; show column number
    '(line-number-mode t)                      ;; show line number

    '(ido-mode t)
    '(ido-enable-flex-matching t)
    '(ido-everywhere t)

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

;; for Carbon Emacs 22
(if (and (<= emacs-major-version 22) (eq window-system 'mac))
    (defvar frame-setting-mbp
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
      (if (string-equal system-configuration "i386-apple-darwin9.8.0")
          (defvar frame-setting-mbp
            '(
              (left . 240)
              (width . 120)
              (height . 56)
              (alpha . (90 90))
              )))
      (if (string-equal system-configuration "x86_64-apple-darwin10.0.0")
          (defvar frame-setting-mbp
            '(
              (left . 240)
              (width . 120)
              (height . 56)
              (alpha . (90 90))
              )))
      )
)

;; for Linux
(if (eq window-system 'x)
    (let ()
     (defvar frame-setting-mbp
      '(
        (top . 70)
        (left . 30)
        (width . 120)
        (height . 45)
        (alpha . (90 90))
        ))

     (require 'scim-bridge)
     (add-hook 'after-init-hook 'scim-mode-on)
     (scim-define-common-key (kbd "M-SPC") t)
     (scim-define-common-key (kbd "C-SPC") nil)
     (scim-define-common-key (kbd "C-/") nil)
     (setq scim-cursor-color '("#EB6528" "#4EA4D9" "#C9DE55"))
     ) 
  )

(if frame-setting-mbp
    (let ()
      (setq default-frame-alist frame-setting-mbp
            initial-frame-alist frame-setting-mbp)
      ))


(prefer-coding-system 'utf-8)           ;; use utf8 as default file encoding

;; provide symbol
(provide 'self-custom)
