#lang scheme

#|
    practice 1.9
|#

(define (inc x) (+ x 1))

(define (dec x) (- x 1))

(define (plus a b)
  (if (= a 0) b (inc (plus (dec a) b))))

(define (plus2 a b)
  (if (= a 0) b (plus2 (dec a) (inc b))))

(plus 3 5)
(inc (plus 2 5))
(inc (inc (plus 1 5)))
(inc (inc (inc (plus 0 5))))
(inc (inc (inc 5)))
(inc (inc 6))
(inc 7)
8
; this process is recursive

(plus2 3 5)
(plus2 2 6)
(plus2 1 7)
(plus2 0 8)
8
; this process is iterative
