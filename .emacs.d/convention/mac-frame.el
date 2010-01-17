(defun mac-frame-max ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
    (if (frame-parameter nil 'fullscreen) nil 'fullboth))
  (set-frame-height nil 53)
  (set-frame-width nil 195))            ;; adjust for MacBook Pro

(defun mac-frame-default ()
  (interactive)
;;   (set-frame-position nil
;;                       (cdr (assoc 'left frame-setting-mbp))
;;                       (cdr (assoc 'top frame-setting-mbp)))
  (set-frame-height nil
                    (cdr (assoc 'height frame-setting-mbp)))
  (set-frame-width nil
                   (cdr (assoc 'width frame-setting-mbp))))


(provide 'mac-frame)
