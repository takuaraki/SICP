#lang scheme

#|
    section 1.2.4
|#

; linear recursive process
(define (exptR b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

; linear iterative process
(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b (- counter 1) (* b product))))
(define (exptI b n)
  (expt-iter b n 1))

; faster process
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define (square n) (* n n))
(define (even? n)
  (= (remainder n 2) 0))

; test
(exptR 5 3)
(exptI 5 3)
(fast-expt 5 3)
