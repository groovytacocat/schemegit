#lang sicp


;;the value of any pascal element is 
;;e_n l_m = e_(n-1) l_(m-1) + e_n l_(m-1) for m > 2 and n != m
;;where n is the nth element of pascal line l


;;Pascal Line 1 and Line 2 have all elements of 1

;;Procedure to produce elements starting with l = 3

(define (pascal element line)
  (cond ((or (= element line) (= element 1)) 1)
        (else
         (+
          (pascal (- element 1) (- line 1))
          (pascal element (- line 1))))))

