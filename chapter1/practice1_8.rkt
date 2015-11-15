#lang scheme

#|
    practice 1.8 "cubic root"
|#

(define (abs x) (if (> x 0) x (- x)))

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.001))

(define (cubic-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubic-root-iter (improve guess x) x)))

(define (cubic-root x)
  (cubic-root-iter 1.0 x))

; test
(cubic-root 2)
(cube (cubic-root 2))