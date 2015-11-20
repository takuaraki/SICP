#lang racket

#|
    practice 1.3
|#

(define (square x) (* x x))

(define (sum-of-square x y) (+ (square x) (square y)))

; return bigger value
(define (max2 x y) (if (> x y) x y))

; return biggest value of 3
(define (max3 x y z) (max x (max y z)))

; return second biggest value
(define (second-max x y z)
  (cond ((= x (max3 x y z)) (max2 y z))
        ((= y (max3 x y z)) (max2 x z))
        ((= z (max3 x y z)) (max2 x y))))

; my answer
(define (sum-of-square1_3 x y z) (sum-of-square (max3 x y z) (second-max x y z)))

(sum-of-square1_3 3 2 5)