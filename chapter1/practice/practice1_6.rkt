#lang scheme

#|
    practice 1.6 "new if"
|#

; Eva defined new-if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; test new-if
(new-if (= 2 3) 0 5)
(cond ((= 2 3) 0)
      (else 5))

(new-if (= 1 1) 0 5)
(cond ((= 1 1) 0)
      (else 5))

; define new-sqrt-iter
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x) x)))

; test new-sqrt-iter
; I think this code may cause infinite loop.
(new-sqrt-iter 1.0 2)

; Here is my description.
; I think applicative-order evaluation cause infinite loop.
(new-if (good-enough? 1.0 2)
        1.0
        (new-sqrt-iter (improve 1.0 x) x))

(new-if #f
        1.0
        (new-sqrt-iter 1.5 2))

; Next, '(new-sqrt-iter 1.5 2)' will be evaluated because it is an argument of 'new-if'.
(new-if #f
        1.0
        (new-if (good-enough? 1.5 2)
                1.5
                (new-sqrt-iter (improve 1.5 2) 2)))

(new-if #f
        1.0
        (new-if #f
                1.5
                (new-sqrt-iter 1.4166666666666665 2)))

; Next, '(new-sqrt-iter 1.4166666666666665 2)' will be evaluated because it is an argument of 'new-if'.

; ...

; else-clause (new-sqrt-iter) will be evaluated infinitely.
