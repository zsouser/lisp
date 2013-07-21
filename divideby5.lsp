;;; LISP PROJECT - Divide By 5
;; Zach Souser - CS 3210 - Spring 2013
;; =================================================================

;; Divisible By Five 
;; parameter - n - the number to be evaluated
;; returns true if the number is divisible by 5, nil otherwise

(defun divisible-by-5 (n) 
  (cond
   ((not (numberp n)) nil)
   ((equal (mod n 5) 0) t)
   (t nil)
  )
)

;; Test Plan:
;; 0 -- true
;; 1 -- false
;; 5 -- true
;; 10 -- true

;; Divide By Five Helper Function
;; params - n - the counter
;; params - lst - the list
;; Checks whether lst is null, indicating the end of the recursion, returning the counter
;; Then checks whether each number is divisible by five, incrementing the counter accordingly

(defun do-divide-by-5 (n lst)
  (cond
   ((null lst) n)
   ((not (numberp n)) nil)
   ((not (listp lst)) nil)
   ((divisible-by-5 (car lst)) (do-divide-by-5 (+ 1 n) (cdr lst)))
   (t (do-divide-by-5 n (cdr lst)))
  )
)

;; test plan not necessary, will be tested in divide-by-5

;; Divide By Five Counter
;; param - lst - the list of integers to be evaluated
;; Starts the divide by five recursion after checking that the list is in fact a list

(defun divide-by-5 (lst) 
  (cond
   ((not (listp lst)) nil)
   (t (do-divide-by-5 0 lst))
  )
)

;; test plan:
;; empty list -- (divide-by-5 '()) -- expected: 0
;; list expected to return 0 -- (divide-by-5 '(2 3 4)) -- expected: 0
;; list expected to return >0 -- (divide-by-5 '(1 2 4 5 10 2 15)) -- expected: 3

