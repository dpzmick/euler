(use srfi-13)
(include "library")

(define (isThreeDigit? number)
  (= 3
     (string-length
       (number->string number))))

(define (isPalindrome? number)
  (string=?
    (number->string number)
    (string-reverse (number->string number))))

(define (threeDigitDivisor number)
  (let loop ((i 999))
    (if (= i 111)
      #f
      (if (divisible? number i)
	(if (isThreeDigit? i)
	  i
	  (loop (- i 1)))
	(loop (- i 1))))))

(define (bothThreeDigit? number)
  (if (threeDigitDivisor number)
    (isThreeDigit? (/ number (threeDigitDivisor number)))
    #f))

(define (largestPalindrome)
  (let loop ((i 998001))
     (if (= i 10000)
     #f
     (if (isPalindrome? i)
       (if (bothThreeDigit? i)
	 i
	 (loop (- i 1)))
       (loop (- i 1))))))

(display (largestPalindrome))
