;;; LISP PROJECT - Untwin
;; Zach Souser - CS 3210 - Spring 2013
;; =================================================================

;; Check Twin Helper class
;; params
;;  lst - the list in progress
;;  x - the list pointer
;;  last - the marker for the end of the list
;; checks that the list is not empty, and checks that the end has not been reached
;; checks whether there is a twin, and removes it if there is one

(defun checktwin (lst x last)
  (cond 
   ((null lst) nil)
   ((= x last) lst)
   ((equal (car lst) (cadr lst)) (checktwin (append (list (car lst)) (cddr lst)) (+ x 1) last))
   (t (checktwin (append (cdr lst) (list (car lst))) (+ x 1) last))
  )
)

;; see untwin for test plan

;; Un-Twin Function
;; Calls the recursive checktwin function to remove twins

(defun untwin (lst) 
  (cond
   ((null lst) nil)
   (t (checktwin lst 0 (length lst)))
  )
)

;; test plan
;; null list - (untwin '()) -- nil
;; no twins - (untwin '(a b)) -- (a b)
;; twins - (untwin '(a a b)) -- (a b)

