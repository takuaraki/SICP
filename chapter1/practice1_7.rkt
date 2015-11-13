#lang scheme

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; new good-enough?
(define (good-enough?2 guess x)
  (< (abs (- (improve guess x) guess)) 0.001))

(define (sqrt-iter2 guess x)
  (if (good-enough?2 guess x)
      guess
      (sqrt-iter2 (improve guess x) x)))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))

; test 100000000000000001
; (sqrt 100000000000000001) <- this code cannot finish calculation in my environment.
(sqrt2 100000000000000001)

; test 0.0001, the correct answer is 0.01
(sqrt 0.0001)  ; result: 0.03230844833048122
(sqrt2 0.0001) ; result: 0.010120218365353947 <- nearer to the correct answer than (sqrt 0.0001)