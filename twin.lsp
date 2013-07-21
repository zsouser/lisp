;;; LISP PROJECT - Twin
;; Zach Souser - CS 3210 - Spring 2013
;; =================================================================

;; Twin Helper function
;; params - 
;;   lst - the list being processed
;;   new - the new list to be returned
;; if the list is empty, return the new list
;; otherwise add the twin to the list

(defun do-twin (lst new)  
  (cond
   ((null lst) new)
   (t (do-twin (cdr lst) (cons (car lst) (cons (car lst) new))))
  )
)

;; test plan: see test plan for twin

;; Twin Function
;; param - lst - the list to be "twinned"
;; Calls the recursive helper function

(defun twin (lst)
  (do-twin lst '())
)

;; test plan:
;; empty list - (twin '()) -- nil
;; any list -- (twin '(a b c)) -- (a a b b c c)
;; a list with a double -- (twin '(a b c c)) -- (a a b b c c c c)
