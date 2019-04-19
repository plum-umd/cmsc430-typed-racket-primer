#lang typed/racket
(provide (all-defined-out))

;; Read
;; - https://docs.racket-lang.org/ts-guide
;; - https://docs.racket-lang.org/ts-reference/

(module+ test
  (require typed/rackunit))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Numeric functions

(: fact (Nonnegative-Integer -> Nonnegative-Integer))
;; Compute n!
(define (fact n) 0)

(module+ test
  (require typed/rackunit)
  (test-equal? "fact_0" (fact 0) 1)
  (test-equal? "fact_1" (fact 1) 1)
  (test-equal? "fact_2" (fact 2) 2)
  (test-equal? "fact_3" (fact 5) 120))

(: fib (Nonnegative-Integer -> Nonnegative-Integer))
;; Compute nth Fibonnaci number
(define (fib n) 0)

(module+ test
  (test-equal? "fib_0" (fib 0) 0)
  (test-equal? "fib_1" (fib 1) 1)
  (test-equal? "fib_2" (fib 2) 1)
  (test-equal? "fib_3" (fib 3) 2)
  (test-equal? "fib_4" (fib 4) 3)
  (test-equal? "fib_5" (fib 5) 5)
  (test-equal? "fib_6" (fib 6) 8)
  (test-equal? "fib_7" (fib 20) 6765))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; String functions

(: longer (String String -> String))
;; Select the longer of the two strings (or first if same length)
(define (longer s1 s2) s1)

(module+ test
  (test-equal? "longer_0" (longer "" "") "")
  (test-equal? "longer_1" (longer "abc" "d") "abc")
  (test-equal? "longer_2" (longer "a" "bcd") "bcd")
  (test-equal? "longer_3" (longer "ab" "cd") "ab"))

(: explode (String -> [Listof String]))
;; Explode a string into a list of length-1 strings
(define (explode s) '())

(module+ test
  (test-equal? "explode_0" (explode "") '())
  (test-equal? "explode_1" (explode "a") '("a"))
  (test-equal? "explode_1" (explode "abc") '("a" "b" "c")))

(: bigrams (String -> [Listof [List String String]]))
;; Compute list of bigrams (pairs of adjacent letters) in a string
(define (bigrams s) '())

(module+ test
  (test-equal? "bigrams_0" (bigrams "") '())
  (test-equal? "bigrams_1" (bigrams "a") '())
  (test-equal? "bigrams_1" (bigrams "ab") '(("a" "b")))
  (test-equal? "bigrams_1" (bigrams "abc") '(("a" "b") ("b" "c"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Simple list functions

(: length-lon ([Listof Number] -> Natural))
;; Compute the length of given list of numbers
(define (length-lon ls) 0)

(module+ test
  (test-equal? "length-lon_0" (length-lon '()) 0)
  (test-equal? "length-lon_1" (length-lon '(1)) 1)
  (test-equal? "length-lon_2" (length-lon '(2)) 1)
  (test-equal? "length-lon_3" (length-lon '(1 2)) 2))

(: sum ([Listof Number] -> Number))
;; Compute the sum of given list of numbers
(define (sum ls) 0)

(module+ test
  (test-equal? "sum_0" (sum '()) 0)
  (test-equal? "sum_1" (sum '(1)) 1)
  (test-equal? "sum_2" (sum '(2)) 2)
  (test-equal? "sum_3" (sum '(1 2)) 3))

(: zip-add ([Listof Number] [Listof Number] -> [Listof Number]))
;; Compute the pairwise sum of given list of numbers
;; ASSUME: lists have equal length
(define (zip-add ls1 ls2) (list 0))

(module+ test
  (test-equal? "zip-add_0" (zip-add '() '()) 0)
  (test-equal? "zip-add_1" (zip-add '(1) '(2)) '(3))
  (test-equal? "zip-add_2" (zip-add '(1 3) '(2 4)) '(3 7)))

(: zip-lon ([Listof Number] [Listof Number] -> [Listof [List Number Number]]))
;; Compute the pairwise list of given list of numbers
;; ASSUME: lists have equal length
(define (zip-lon ls1 ls2) (list (list 0 0)))

(module+ test
  (test-equal? "zip-lon_0" (zip-lon '() '()) '())
  (test-equal? "zip-lon_1" (zip-lon '(1) '(2)) '((1 2)))
  (test-equal? "zip-lon_2" (zip-lon '(1 3) '(2 4)) '((1 2) (3 4))))

(: max-lon ([Pairof Real [Listof Real]] -> Real))
;; Compute max element of non-empty list of numbers
(define (max-lon xs) (first xs))
  
(module+ test
  (test-equal? "max-lon_0" (max-lon '(1)) 1)
  (test-equal? "max-lon_1" (max-lon '(1 2)) '(2))
  (test-equal? "max-lon_2" (max-lon '(2 1)) '(2))
  (test-equal? "max-lon_3" (max-lon '(2 3 1)) '(3)))

(: sort-asc ([Listof Real] -> [Listof Real]))
;; Sort list into ascending order
(define (sort-asc xs) xs)

(module+ test
  (test-equal? "sort-asc_0" (sort-asc '()) '())
  (test-equal? "sort-asc_1" (sort-asc '(1)) '(1))
  (test-equal? "sort-asc_2" (sort-asc '(1 2)) '(1 2))
  (test-equal? "sort-asc_3" (sort-asc '(2 1)) '(1 2))
  (test-equal? "sort-asc_4" (sort-asc '(2 3 1)) '(1 2 3)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Polymorphic list functions

(: minimize (∀ (α) (α -> Real) [Pairof α [Listof α]] -> α))
;; Find element that minimizes the given measure (take first if more than one)
(define (minimize f xs) (first xs))

(module+ test
  (test-equal? "minimize_0" (minimize abs '(1 -2 3)) 1)
  (test-equal? "minimize_1" (minimize string-length '("abc" "d" "efg")) "d")
  (test-equal? "minimize_2" (minimize string-length '("abc" "d" "ef" "g")) "d"))

(: sort (∀ (α) (α α -> Boolean) [Listof α] -> [Listof α]))
;; Sort list in ascending order according to given comparison
;; ENSURE: result is stable
(define (sort < xs) xs)

(module+ test
  (test-equal? "sort_0" (sort < '(1 -2 3)) '(-2 1 3))
  (test-equal? "sort_1" (sort string<? '("abc" "d" "efg")) '("d" "abc" "efg"))  
  (test-equal? "sort_2"
               (sort (λ ([s1 : String] [s2 : String])
                       (< (string-length s1) (string-length s2)))
                     '("efg" "d" "abc")) '("d" "efg" "abc")))

(: zip (∀ (α β) ([Listof α] [Listof β] -> [Listof [List α β]])))
;; Zip together lists into a list of lists
;; ASSUME: lists are the same length
(define (zip as bs) '())

(module+ test
  (test-equal? "zip_0" (zip '() '()) '())
  (test-equal? "zip_1" (zip '(1) '(2)) '((1 2)))
  (test-equal? "zip_2" (zip '(1 3) '(2 4)) '((1 2) (3 4)))
  (test-equal? "zip_3" (zip '(1 3) '("a" "b")) '((1 "a") (3 "b"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Understanding
#|

   Give a brief English description of each of the following types or type
   constructors:
   - Listof
   - List
   - Pairof
   - Real
   - Natural
   - Number
   - ->

   Subtyping: which of these are subtypes:
   - Number <: Natural
   - Real <: Number
   - [Pairof Number Number] <: [Listof Number]
   - [Pairof Number [Listof Number]] <: [Listof Number]
   - [Real -> Number] <: [Number -> Real]
   - [Real -> Real] <: [Number -> Number]
   - [Number -> Number] <: [Real -> Real]
   - [List Real Real] <: [Listof Number]
   
|#
