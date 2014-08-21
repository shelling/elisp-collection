;;; coding-pair.el

;;; author: shelling  <navyblueshellingford at gmail.com>


;;; [ introduction ]
;;;
;;; include () {} || "" '' -> => :: []
;;; all functions are interactive
;;; => and -> are named by its meaning in Perl
;;;

;;; [ note ]
;;; this script also include erb syntax <%=  %> and <%  %>
;;;

;; undefine C-o
(define-key global-map "\C-o" nil)

;; insert ()
(define-key global-map
  "\C-oo"
  '(lambda ()
     (interactive)
     (insert "()")
     (backward-char)))

;; insert {}
(define-key global-map
  "\C-ou"
  '(lambda ()
     (interactive)
     (insert "{}")
     (backward-char)))

;; insert ||
(define-key global-map
  "\C-oi"
  '(lambda ()
     (interactive)
     (insert "||")
     (backward-char)))

;; insert ""
(define-key global-map
  "\C-od"
  '(lambda ()
     (interactive)
     (insert "\"\"")
     (backward-char)))

;; insert ''
(define-key global-map
  "\C-os"
  '(lambda ()
     (interactive)
     (insert "''")
     (backward-char)))

;; insert ->
(define-key global-map
  "\C-or"
  '(lambda ()
     (interactive)
     (insert "->")))

;; insert =>
(define-key global-map
  "\C-om"
  '(lambda ()
     (interactive)
     (insert "=>")))

;; insert ::
(define-key global-map
  "\C-on"
  '(lambda ()
     (interactive)
     (insert "::")))

;; insert <>
(define-key global-map
  "\C-ov"
  '(lambda ()
     (interactive)
     (insert "<>")
     (backward-char)))

;; insert <%=  %>
(define-key global-map
  "\C-o5"
  '(lambda ()
     (interactive)
     (insert "<%=  %>")
     (backward-char 3)))

;; insert <%  %>
(define-key global-map
  "\C-o%"
  '(lambda ()
     (interactive)
     (insert "<%  %>")
     (backward-char 3)))

;; insert []
(define-key global-map
  "\C-ok"
  '(lambda ()
     (interactive)
     (insert "[]")
     (backward-char)))

;; insert /*  */
(define-key global-map
  "\C-o8"
  '(lambda ()
     (interactive)
     (insert "/*  */")
     (backward-char 3)))
