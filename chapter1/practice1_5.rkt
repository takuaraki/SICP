#lang racket

#|
    practice 1.5
|#

(define (p) (p))
(define (test x y) (if (= x 0) 0 y))

(test 0 (p))


; applicative-order evaluation
; (test 0 (p)) -> (test 0 (p)) -> (test 0 (p)) -> ....
; infinite loop!


; normal-order evaluation
; (test 0 (p)) -> (if (= 0 0) 0 (p)) -> 0
; result: 0