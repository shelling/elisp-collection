(defun mac-frame-max ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
    (if (frame-parameter nil 'fullscreen) nil 'fullboth))
  (set-frame-height nil 53)
  (set-frame-width nil 195))            ;; adjust for MacBook Pro

(defun mac-frame-default ()
  (interactive)
  (set-frame-height nil frame-default-height)
  (set-frame-width nil frame-default-width))


(provide 'mac-frame)
