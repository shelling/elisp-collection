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


;; quit coding pair
(defun exit-coding-pair ()
  (interactive)
  (forward-char))

(define-key global-map "\M-pl" 'exit-coding-pair)

;; insert ()
(defun insert-parenthesis ()
  (interactive)
  (insert "()")
  (backward-char))

(define-key global-map "\M-po" 'insert-parenthesis)

;; insert {}
(defun insert-brace ()
  (interactive)
  (insert "{}")
  (backward-char))

(define-key global-map "\M-pu" 'insert-brace)

;; insert ||
(defun insert-parallel ()
  (interactive)
  (insert "||")
  (backward-char))

(define-key global-map "\M-pi" 'insert-parallel)

;; insert ""
(defun insert-double-quote ()
  (interactive)
  (insert "\"\"")
  (backward-char))

(define-key global-map "\M-pd" 'insert-double-quote)

;; insert ''
(defun insert-single-quote ()
  (interactive)
  (insert "''")
  (backward-char))

(define-key global-map "\M-ps" 'insert-single-quote)

;; insert ->
(defun insert-reference ()
  (interactive)
  (insert "->"))

(define-key global-map "\M-pr" 'insert-reference)

;; insert =>
(defun insert-mapping ()
  (interactive)
  (insert "=>"))

(define-key global-map "\M-pm" 'insert-mapping)

;; insert ::
(defun insert-namespace-separator ()
  (interactive)
  (insert "::"))

(define-key global-map "\M-pn" 'insert-namespace-separator)

;; insert <>
(defun insert-tag-pair ()
  (interactive)
  (insert "<>")
  (backward-char))

(define-key global-map "\M-pv" 'insert-tag-pair)

;; insert <%=  %>
(defun insert-erb-eval ()
  (interactive)
  (insert "<%=  %>")
  (backward-char 3))

(define-key global-map "\M-p5" 'insert-erb-eval)

;; insert <%  %>
(defun insert-erb-tag ()
  (interactive)
  (insert "<%  %>")
  (backward-char 3))

(define-key global-map "\M-p%" 'insert-erb-tag)

;; insert []
(defun insert-key-tag ()
  (interactive)
  (insert "[]")
  (backward-char))

(define-key global-map "\M-pk" 'insert-key-tag)


(provide 'coding-pair)