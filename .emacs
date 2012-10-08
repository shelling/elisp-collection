(package-initialize)

(require 'cl)

(require 'yasnippet)
(yas-global-mode 1)

(require 'redo+)                         ; need key mapping
(require 'rect-mark)
(require 'sr-speedbar)
(require 'autopair)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/"))
(require 'pod-mode)
(require 'folding)

(defun load-all (name)
  (let ((type (car (file-attributes name))))
    (cond 
     ;; is file
     ((eq type nil) 
      (load 
       (file-name-nondirectory (replace-regexp-in-string "\\.el$" "" name))))
     ;; is dir
     ((eq type t)
      (progn 
        (add-to-list 'load-path (expand-file-name name))
        (loop for file in-ref (directory-files name)
              do 
              (if (and (not (string= ".." file)) 
                       (not (string= "." file)))
                  (load-all (concat (file-name-as-directory name) file))))))
     ;; is symlink
     (t (load-all type))
     )))

(load-all "~/.emacs.d/etc")



