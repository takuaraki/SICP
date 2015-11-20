#lang scheme

#|
    section 1.1.8
|#

(define (square1 x) (* x x))

(define (square2 x) (exp (double (log x))))

(define (double x) (+ x x))

(square1 4)

(square2 4)

(define (average x y) (/ (+ x y) 2))

; block structure (one solution of packaging problem)
(define (sqrt x)
  (define (good-enough? guess x) ; private good-enough?
    (< (abs (- (square1 guess) x)) 0.001))
  (define (improve guess x) (average guess (/ x guess))) ; private improve
  (define (sqrt-iter guess x) ; private sqrt-iter
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(sqrt 2)

; lexical scoping
(define (sqrt2 x) ; x is free variable
  (define (good-enough? guess) ; private good-enough? which can obtain x from argument of sqrt.
    (< (abs (- (square1 guess) x)) 0.001))
  (define (improve guess) (average guess (/ x guess))) ; private improve
  (define (sqrt-iter guess) ; private sqrt-iter
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(sqrt2 2)