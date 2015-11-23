#lang scheme

#|
    practice 1.13
|#

#|
pascal(5, 4) = pascal(4, 3) + pascal(4, 4)
pascal(4, 4) = 1
pascal(1, 4) = 1
pascal(4, 5) = 0
pascal(0, 4) = 0

if (col < 1) or (row < 0) or (row < col)
pascal(row, col) = 0
else if (col = 1) or (row = col)
pascal(row, col) = 0
else
pascal(row, col) = pascal(row-1, col-1) + pascal(row-1, col)
|#

(define (pascal row col)
  (cond ((or (< row 1) (< col 1) (< row col)) 0)
        ((or (= col 1) (= row col)) 1)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))

; test
(pascal 1 1)
(pascal 2 1)
(pascal 2 2)
(pascal 3 1)
(pascal 3 2)
(pascal 3 3)
(pascal 4 1)
(pascal 4 2)
(pascal 4 3)
(pascal 4 4)
(pascal 5 1)
(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
(pascal 5 5)

(pascal 3 4)
(pascal 0 4)