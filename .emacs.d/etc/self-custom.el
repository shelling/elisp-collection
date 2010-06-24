;; custom.el
;;

(custom-set-variables
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
;;     '(cua-mode t nil (cua-base))               ;; using C-x, C-c, C-v to cut, copy and paste
    '(mac-option-modifier 'meta)               ;; set mac option as meta
    '(mac-command-modifier 'super))

(set-face-attribute 'mode-line nil :box nil)
;; (global-font-lock-mode t)

(custom-set-faces)

(setq-default speedbar-show-unknown-files t
              truncate-lines              t
              sr-speedbar-right-side      nil)

(setq
 rcirc-default-nick              "shelling_mbp"
 rcirc-default-full-name         "shelling ford"
 rcirc-server-alist              '(
                                   ("irc.freenode.net" :channels ("#emacs" "#chupei.pm" "#shelling"))
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
    (defvar frame-setting-mbp
      '(
        (left . 240)
        (width . 120)
        (height . 56)
        (alpha . (90 90))
        )))

;; for Linux
(if (eq window-system 'x)
    (defvar frame-setting-mbp
      '(
        (left . 30)
        (width . 120)
        (height . 45)
        (alpha . (90 90))
        ))
  )

(if frame-setting-mbp
    (let ()
      (setq default-frame-alist frame-setting-mbp
            initial-frame-alist frame-setting-mbp)
      ))


(prefer-coding-system 'utf-8)           ;; use utf8 as default file encoding

;; provide symbol
(provide 'self-custom)