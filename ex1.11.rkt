#lang sicp

;;Ex 1.11 A Function f is define by the rule that
;;f(n) = n if n < 3 else f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3
;;Write a procedure that computes f by means of a recursive process
;;Write a procedure that copmutes f by means of an iterative process

;;Recursive Procedure
(define (proc1 n)
  (if (< n 3)
      n
      (+
       (proc1 (- n 1))
       (* 2 (proc1 (- n 2)))
       (* 3 (proc1 (- n 3))))))

;;Iterative Procedure
;;I couldn't figure this one out after a couple hours and looked up the answer
;;I was sort of on the right track with a = 0, b = 1, c = 2.
;;Couldn't figure out how to implement the f(n) function and make it iterable
;;I knew I would need to do something with a + 2b + 3c
;;Couldn't figure out how to update the state variables :(

;;ONLINE ANSWER
(define (proc2 n)
  (define (proc-iter a b c n)
    (if (= n 0)
        a
        (proc-iter b c (+ c (* 2 b) (* 3 a)) (- n 1))))
  (proc-iter 0 1 2 n))
