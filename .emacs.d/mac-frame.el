(setq frame-default-height 36
      frame-default-width 120)

(setq default-frame-alist '((width . 120) (height . 36)))

(defun mac-frame-max ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 
    (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

(defun mac-frame-default ()
  (interactive)
  (set-frame-height nil frame-default-height)
  (set-frame-width nil frame-default-width))


(provide 'mac-frame)