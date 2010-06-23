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
