(defun mac-frame-default ()
  "reset frame height and width as the same as frame-setting"
  (interactive)
;;   (set-frame-position nil
;;                       (cdr (assoc 'left frame-setting))
;;                       (cdr (assoc 'top frame-setting)))
  (set-frame-height nil
                    (cdr (assoc 'height frame-setting)))
  (set-frame-width nil
                   (cdr (assoc 'width frame-setting))))


(provide 'mac-frame)
