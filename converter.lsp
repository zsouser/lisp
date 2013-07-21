;;; LISP PROJECT - Fahrenheit to Celsius Converter
;; Zach Souser - CS 3210 - Spring 2013
;; =================================================================
;; Fahrenheit to Celsius converter
;; parameters
;;   params - a list containing a number and either F or C
;;   returns nil if a conversion is not possible

(defun convert (params)
   (cond 
	((not (listp params)) nil)
    ((not (numberp (car params))) nil)
    ((equal (car (cdr params)) 'F) (* (/ 5 9) (- (car params) 32)))
	((equal (car (cdr params)) 'C) (+ 32 (* (/ 9 5) (car params))))
	(t nil)
   )
)

;; test plan:
;; empty list -- (convert '())
;; valid c->f -- (convert '(100 C))
;; valid f->c -- (convert '(212 F))
