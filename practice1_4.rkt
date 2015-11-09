#lang racket

#|
    practice 1.4
|#

(define (a-plus-abs-b a b) ((if (> b 0) + -) a b))

; All answer below here is 8. 

(a-plus-abs-b 3 5)

((if (> 5 0) + -) 3 5)

(+ 3 5)

(a-plus-abs-b 3 -5)

((if (> -5 0) + -) 3 -5)

(- 3 -5)


