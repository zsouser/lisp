;;; LISP PROJECT - Checker
;; Zach Souser - CS 3210 - Spring 2013
;; =================================================================


;; Number-checker helper function

(defun check-number (lst) 
  (equal 3 (length lst))
)

;; Numeric-checking helper function

(defun check-numeric (lst)
  (and
   (numberp (car lst))
   (numberp (caddr lst)) 
  ) 
)


;; Validity-checking helper function

(defun check-valid (lst)
  (or
   (equal (cadr lst) 'plus)
   (equal (cadr lst) 'minus)
   (equal (cadr lst) 'times)
   (equal (cadr lst) 'dividedby)
  )
)

;; Checker function
;; Tests whether the operands are expressions,
;; recursively calling checker on said expressions
;; until finally checking the three helper methods
;; param - lst - the list

(defun checker (lst)
 (and
  (not (null lst))
  (or
   (and
    (cond
     ((listp (car lst)) (checker (car lst)))
	 ((numberp (car lst)) t)
    )
    (cond
     ((listp (caddr lst)) (checker (caddr lst)))
	 ((numberp (caddr lst)) t)
    )
   )
   (and
    (check-number lst) 
    (check-numeric lst) 
    (check-valid lst)
   )
  ) 
 )
)

;; test plan:
;; empty list - (checker '()) - nil
;; wrong number - (checker '(4 plus)) - nil
;; non-numeric - (checker '(p plus 3)) - nil
;; invalid - (checker '(3 bummer 3)) - nil
;; valid - (checker '(1 plus 1)) - t