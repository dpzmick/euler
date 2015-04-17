(use trace)
(use srfi-1)

(define (last-two lst)
  (list-tail lst (- (length lst) 2)))

(define (numLen num) (string-length (number->string num)))

(define (nextFib fibs)
  (eval (append (list '+) (last-two fibs))))

(define (fibsUntil prev mx)
  (if (=  mx (length prev))
    (reverse prev)
    (fibsUntil 
      (append prev (list (nextFib prev))) 
      mx)))

(define (firstFibWith numDigits prev)
  (if (= numDigits (numLen (last prev)))
    (last prev)
    (firstFibWith numDigits (fibsUntil prev (+ 1 (length prev))))))

(trace numLen)
; (trace fibsUntil)
; (print (fibsUntil (list 0 1) 500))
(print (numLen (car (fibsUntil (list 0 1) 50000))))
