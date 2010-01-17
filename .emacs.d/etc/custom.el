;; custom.el
;;

(custom-set-variables
    '(auto-save-mode nil)                      ;; forbidden auto-save
    '(global-hl-line-mode t)                   ;; highlight current line
    '(delete-old-versions Delete)              ;; kill all filename~
    '(make-backup-files nil)                   ;; not back up file into filename~

    '(column-number-mode t)                    ;; show column number
    '(line-number-mode t)                      ;; show line number
    '(indent-tabs-mode nil)                    ;; expand tab to set
    '(mac-option-modifier 'meta)               ;; set mac option as meta
    '(mac-command-modifier 'hyper)
;;     '(cua-mode t nil (cua-base))               ;; using C-x, C-c, C-v to cut, copy and paste
)

(set-face-attribute 'mode-line nil :box nil)
;; (global-font-lock-mode t)

(custom-set-faces)


;; default frame setting
;; (setq frame-default-height 53
;;       frame-default-width 120)          ;; my own convention variables

(defvar frame-setting-mbp
  '((top . 26)
    (left . 350)
    (width . 120)
    (height . 53)))

(setq default-frame-alist frame-setting-mbp)

(setq initial-frame-alist frame-setting-mbp)


(prefer-coding-system 'utf-8)           ;; use utf8 as default file encoding

;; provide symbol
(provide 'custom)