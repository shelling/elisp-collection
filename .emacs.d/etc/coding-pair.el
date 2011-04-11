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

;; quit coding pair
;; not completed
(defun exit-coding-pair ()
  (interactive)
  (forward-char))

(define-key global-map "\M-pl" 'exit-coding-pair)


;; insert ()
(defun insert-parenthesis ()
  (interactive)
  (insert "()")
  (backward-char))

;; (define-key global-map "\M-po" 'insert-parenthesis)
(define-key global-map "\C-oo" 'insert-parenthesis)

;; insert {}
(defun insert-brace ()
  (interactive)
  (insert "{}")
  (backward-char))

;; (define-key global-map "\M-pu" 'insert-brace)
(define-key global-map "\C-ou" 'insert-brace)

;; insert ||
(defun insert-parallel ()
  (interactive)
  (insert "||")
  (backward-char))

;; (define-key global-map "\M-pi" 'insert-parallel)
(define-key global-map "\C-oi" 'insert-parallel)

;; insert ""
(defun insert-double-quote ()
  (interactive)
  (insert "\"\"")
  (backward-char))

;; (define-key global-map "\M-pd" 'insert-double-quote)
(define-key global-map "\C-od" 'insert-double-quote)

;; insert ''
(defun insert-single-quote ()
  (interactive)
  (insert "''")
  (backward-char))

;; (define-key global-map "\M-ps" 'insert-single-quote)
(define-key global-map "\C-os" 'insert-single-quote)

;; insert ->
(defun insert-reference ()
  (interactive)
  (insert "->"))

;; (define-key global-map "\M-pr" 'insert-reference)
(define-key global-map "\C-or" 'insert-reference)

;; insert =>
(defun insert-mapping ()
  (interactive)
  (insert "=>"))

;; (define-key global-map "\M-pm" 'insert-mapping)
(define-key global-map "\C-om" 'insert-mapping)

;; insert ::
(defun insert-namespace-separator ()
  (interactive)
  (insert "::"))

;; (define-key global-map "\M-pn" 'insert-namespace-separator)
(define-key global-map "\C-on" 'insert-namespace-separator)

;; insert <>
(defun insert-tag-pair ()
  (interactive)
  (insert "<>")
  (backward-char))

;; (define-key global-map "\M-pv" 'insert-tag-pair)
(define-key global-map "\C-ov" 'insert-tag-pair)

;; insert <%=  %>
(defun insert-erb-eval ()
  (interactive)
  (insert "<%=  %>")
  (backward-char 3))

;; (define-key global-map "\M-p5" 'insert-erb-eval)
(define-key global-map "\C-o5" 'insert-erb-eval)

;; insert <%  %>
(defun insert-erb-tag ()
  (interactive)
  (insert "<%  %>")
  (backward-char 3))

;; (define-key global-map "\M-p%" 'insert-erb-tag)
(define-key global-map "\C-o%" 'insert-erb-tag)

;; insert []
(defun insert-key-tag ()
  (interactive)
  (insert "[]")
  (backward-char))

;; (define-key global-map "\M-pk" 'insert-key-tag)
(define-key global-map "\C-ok" 'insert-key-tag)


(provide 'coding-pair)