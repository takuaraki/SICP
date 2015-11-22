#lang scheme

#|
    practice 1.11
|#

; recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

; iterative
#|
f(6) = f(5) + 2f(4) + 3f(3) ; f(6) is validated
     = f(4) + 2f(3) + 3f(2) + 2f(4) + 3f(3) ; only f(5) is validated
     = 3f(4) + 5f(3) + 3f(2)
     = 3f(3) + 6f(2) + 9f(1) + 5f(3) + 3f(2) ; only f(4) is validated
     = 8f(3) + 9f(2) + 9f(1)
     = 8f(2) + 16f(1) + 24f(0) + 9f(2) + 9f(1) ; only f(3) is validated
     = 17f(2) + 25f(1) + 24f(0)
     = 2 * 17 + 1 * 25 + 0 * 24
     = 59

1,  0,  0 <- initial state (= f(6) + 0f(5) + 0f(4))
1,  2,  3    f(6) is validated
3,  5,  3    f(5) is validated
8,  9,  9    f(4) is validated
17, 25, 24   f(3) is validated
validate 4 times

1,  0,  0
(1 + 0), (2 * 1 + 0), (3 * 1)
1,  2,  3
(1 + 2), (2 * 1 + 3), (3 * 1)
3,  5,  3
(3 + 5), (2 * 3 + 3), (3 * 3)
8,  9,  9
(8 + 9), (2 * 8 + 9), (3 * 8)
17, 25, 24

a, b, c
(a + b), (2 * a + c), (3 * a)

|#

(define (g-iter a b c count)
  (if (= count 0)
      (+ (* 2 a) (* 1 b) (* 0 c))
      (g-iter (+ a b) (+ (* 2 a) c) (* 3 a) (- count 1))))

(define (g n)
  (if (< n 3)
      n
      (g-iter 1 0 0 (- n 2))))

; test
(= (f 1) (g 1))
(= (f 2) (g 2))
(= (f 3) (g 3))
(= (f 4) (g 4))
(= (f 5) (g 5))
(= (f 6) (g 6))
