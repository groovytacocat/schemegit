;SICP
;Exercise 1.2
;(/ (+ 5 4
;      (- 2
;         (- 3
;            (+ 6 (/ 4 5)))))
;   (* 3
;      (- 6 2)
;      (- 2 7)))

;Exercise 1.3
;Define a procedure that takes three numbers as arguments
;and returns the sum of the squares of the two larger numbers
#|(define (square x) (* x x))
(define (sumSquare x y) (+ (square x) (square y)))
(define (>= num1 num2) (not (< num1 num2)))
(define (<= num1 num2) (not (> num1 num2)))
(define (foo x y z)
  (sumSquare
              (cond ((and (>= x y) (>= x z)) x)
                    ((>= y z) y)
                    (else z))
              (cond ((and (<= x y) (<= x z)) (if (>= y z) z y))
                    ((and (<= y x) (<= y z)) (if (>= x z) z x)))))|#
#|Exercise 1.4
Observe that our model of evaluations allows for combinations whose operators are compound expressions.
Use this observation to describe the behavior of the following procedure:
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))
Ans: The procedue sums a with the absolute value of b by having a conditional return either + if b is non-negative
or in the case of b being less than 0 it returns the - operator so that when b is substituted you have a - -b
|#
#|Exercise 1.5 Ben Bitdiddle has invented a test ot determine wheteher the interpreter he is faced with is using
applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))
(define (test x y)
    (if (= x 0) 0 y))

then he evaluates the expression (test 0 (p))

What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he
observe with an interpreter that uses normal-order evaluation? Explain your answer

Normal Order Evaluation would return 0 as it substitutes (test 0 p) with (if (= 0 0) 0 p) which the if evaluates to
true and then returns 0 ... My answer ends here.
Online answer re: Applicative
(test 0 (p)) with applicative order leads to (test 0 (p)) as (p) is defined as itself and has no value
and enters an infinite loop of itself

APPLICATIVE ORDER VS NORMAL ORDER
APPLICATIVE ORDER evaluates arguments then procedure
NORMAL ORDER only uses arguments when value is necessary breaks procedure down into most primitive form to evaluate
|#
