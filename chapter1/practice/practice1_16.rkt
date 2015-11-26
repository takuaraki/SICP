#lang scheme

#|
    practice 1.16
|#

(define (square n) (* n n))

(define (even? n)
  (= (remainder n 2) 0))

(define (expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (expt-iter (square b) (/ n 2) a))
        (else (expt-iter b (- n 1) (* a b)))))

(define (expt b n)
  (expt-iter b n 1))

(expt 2 14)
#|
b   | n  | a
--------------
b   | 14 | 1
b^2 | 7  | 1
b^2 | 6  | b^2
b^4 | 3  | b^2
b^4 | 2  | b^6
b^8 | 1  | b^6
b^8 | 1  | b^14
|#