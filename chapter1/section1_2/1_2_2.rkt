#lang scheme

#|
    section 1.2.2 "fibonacci number"
|#

; recursive
(define (fibR n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fibR (- n 1))
                 (fibR (- n 2))))))

; iterative
(define (fibI n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

(fibR 6)
(fibI 6)

#|
    section 1.2.2 "exchange pattern"
|#

(define (count-change amount) (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
         ((or (< amount 0) (= kinds-of-coins 0)) 0)
         (else (+ (cc amount (- kinds-of-coins 1))
                  (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)

(define (cc-iter amount ))




