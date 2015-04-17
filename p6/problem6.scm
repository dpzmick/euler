(use trace)
(define (count n) (tailC n 0 '()))
(define (tailC n l lst)
  (if (= l  n)
    (append lst (list l))
    (tailC
      n
      (+ 1 l)
      (append lst (list l)))))
(trace tailC)

(print (count 10))
