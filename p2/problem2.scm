(define (last-two lst)
  (list-tail lst (- (length lst) 2)))

(define (last lst)
  (list-ref lst (- (length lst) 1)))

(define (nextFib fibs)
  (eval (append (list '+) (last-two fibs))))

(define (fibsUntilEvens n)
	(fibsUntilHelp (list 0 1) n))

(define (fibsUntilHelp prev mx)
	(if (> (last prev) mx)
		(reverse (cdr (reverse prev)))
		(fibsUntilHelp 
			(append prev (list (nextFib prev))) 
			mx)))
(define (sumEvens sum lst)
	(if (null? lst)
	sum
	(if (even? (car lst))
		(sumEvens (+ (car lst) sum) (cdr lst))
		(sumEvens sum (cdr lst)))))

(print (sumEvens 0 (fibsUntilEvens 4000000)))
