#lang racket

; '(define x 3)' is special form
(define x 3)
x

; procedure definition
; (define (<name> <arg>) (<body>))

; compound procedure name "square"
(define (square x) (* x x))

(square 21)

(square (+ 2 5))

(square (square 3))

;square can use another definition
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
(f 5)