(define (factor num) (f num 2))
(define (f n i)
    (cond
        ((= n i) 
            (list 1 n))
        ((integer? (/ n i))
            (append (f (/ n i) 2) (list i)))
        (else
            (append (f n (+ i 1)))))) 


(print (factor 600851475143))
