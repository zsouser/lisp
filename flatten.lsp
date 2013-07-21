;;; LISP PROJECT - Flatten
;; Zach Souser - CS 3210 - Spring 2013
;; =================================================================
;; Flatten Function
;; params - lst - the list to be flattened
;; tests whether the list is null, and proceeds to recursively
;; call do-flatten with modified lists

(defun flatten (lst)
  (cond 
   ((null lst) nil)
   ((null (car lst)) (flatten (cdr lst)))
   ((atom (car lst)) (cons (car lst) (flatten (cdr lst))))
   (t (append (flatten (car lst)) (flatten (cdr lst))))
  )
)

;; test plan:
;; empty list - (flatten '()) -- nil
;; flat list - (flatten '(a b c)) -- (a b c)
;; nested list - (flatten '(a (b c) d)) - (a b c d)
;; nested null list - (flatten '(a b () c d)) - (a b c d)
