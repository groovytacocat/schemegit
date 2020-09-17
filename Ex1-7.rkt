#|
Exercise 1.7: e good-enough? test used in computing
square roots will not be very effective for finding the square
roots of very small numbers. Also, in real computers, arithmetic
operations are almost always performed with limited
precision. is makes our test inadequate for very large
numbers. Explain these statements, with examples showing
how the test fails for small and large numbers. An alternative
strategy for implementing good-enough? is to watch
how guess changes from one iteration to the next and to
stop when the change is a very small fraction of the guess.
Design a square-root procedure that uses this kind of end
test. Does this work beer for small and large numbers?

(define (square x) (* x x))
(define (avg x y)
  (/ (+ x y) 2))
(define (<= x y)
  (or (< x y) (= x y)))
(define (improve guess x)
  (avg guess (/ x guess)))
(define (diff guess1 N)
  (- (improve guess1 N) guess1))
(define (newgood guess x)
  (<= (abs (diff guess x)) (* .0001 guess)))
(define (sqrt-iter guess x)
  (if (newgood guess x)
      guess
      (sqrt-iter (improve guess x) x)))
|#

#|
Newton’s method for cube roots is based on
the fact that if y is an approximation to the cube root of x,
then a beer approximation is given by the value

(x / y ^2) + 2 y
-----------------
       3

Use this formula to implement a cube-root procedure analogous
to the square-root procedure. (In Section 1.3.4 we will
see how to implement Newton’s method in general as an
abstraction of these square-root and cube-root procedures.)

Answer: as above with exception
    (define (improve guess x)
        (/ (+ (/ x (square guess)) (* 2 guess)) 3))
|#

(define (square x) (* x x))
(define (avg x y)
  (/ (+ x y) 2.0))
(define (<= x y)
  (or (< x y) (= x y)))
(define (diff guess1 N)
  (- (improve guess1 N) guess1))
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2.0 guess)) 3.0))
(define (good guess x)
  (<= (abs (diff guess x)) (* .0001 guess)))
(define (cube-root guess x)
  (if (good guess x)
      guess
      (cube-root (improve guess x) x)))



