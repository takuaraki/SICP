#lang racket

#|
conditional

(cond (<p1> <e1>)
      (<p2> <e2>)
      ...
      (<pn> <en>))
|#

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(abs 3)
(abs 0)
(abs -2)

; else (last predicate which is always true)
(define (abs2 x)
  (cond ((< x 0) (- x))
        (else x)))

#|
if (use for only 2 conditions)

(if <predicate>
    <consequent>
    <alternative>)
|#

(define (abs3 x)
  (if (< x 0)
      (- x)
      x))

#|
and, or, not
|#

; and
(define (isGT5LT10 x)
  (if (and (> x 5) (< x 10))
      "true"
      "false"))
(isGT5LT10 8)
(isGT5LT10 4)
(isGT5LT10 13)

; or
(define (>= x y) (or (> x y) (= x y)))
(if (>= 5 3) "true" "false")
(if (>= 3 3) "true" "false")
(if (>= 2 3) "true" "false")

; not
(if (not (< 5 3)) "true" "false") ; '(not (< x y))' and '(>= x y)' are same predicates.
(if (not (< 3 3)) "true" "false")
(if (not (< 2 3)) "true" "false")