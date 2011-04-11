(defun load-all (name)
  (let ((type (car (file-attributes name))))
    (cond 
     ((eq type nil) 
      (load 
       (file-name-nondirectory (replace-regexp-in-string "\\.el$" "" name))))
     ((eq type t)
      (progn 
        (add-to-list 'load-path (expand-file-name name))
        (loop for file in-ref (directory-files name)
              do 
              (if (and (not (string= ".." file)) 
                       (not (string= "." file)))
                  (load-all (concat (file-name-as-directory name) file))
                )
              )
        ))
     (t (load-all type))
     )))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))
(require 'mode)                         ;; major and minor mode
(require 'vendor)                       ;; third party library
(load-all "~/.emacs.d/etc")


(color-theme-railscasts)
;; (color-theme-dark-laptop)
;; (color-theme-blackboard)
;; (color-theme-charcoal-black)
;; (color-theme-deep-blue)
;; (color-theme-gnome2)
;; (color-theme-kingsajz)
