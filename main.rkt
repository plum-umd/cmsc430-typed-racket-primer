#lang typed/racket
(provide (all-defined-out))

;; Read (as needed)
;; - https://docs.racket-lang.org/ts-guide
;; - https://docs.racket-lang.org/ts-reference/

;; These are a series of finger-exercise programs to help you:
;; - learn a bit of Typed Racket
;; - practice with structural recursion and type-based program design

;; This style of programming will be used throughout the course,
;; now is the time to master the style!

;; If you've mastered the style, you can write these programs on auto-pilot.
;; If you haven't, you will struggle.

(module+ test
  (require typed/rackunit))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Numeric functions

;; Follow this template for functions on natural numbers.
#;(: nat-template (Natural ... -> ...))
#;(define (nat-template n)
    (match n
      [0 ...]
      [n (... (nat-template (sub1 n) ...) ...)]))

(: fact (Natural -> Natural))
;; Compute n!
(define (fact n) 0)

(module+ test
  (require typed/rackunit)
  (test-equal? "fact_0" (fact 0) 1)
  (test-equal? "fact_1" (fact 1) 1)
  (test-equal? "fact_2" (fact 2) 2)
  (test-equal? "fact_3" (fact 5) 120))

(: fib (Natural -> Natural))
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

;; Read up on string functions in Racket to implement these.

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

;; Follow this template for functions on lists of numbers where appropriate.
#;(: lon-template ([Listof Number] ... -> ...))
#;(define (lon-template ls ...)
    (match ls
      ['() ...]
      [(cons n ls) (... n (lon-template ls ...) ...)]))

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
;; Peano numbers

;; Unary encoding of the natural numbers
(define-type N (U 'Z (List 'S N)))

(: nat->peano (Natural -> N))
;; Convert natural to Peano
(define (nat->peano n) 'Z)

(module+ test
  (test-equal? "nat->peano_0" (nat->peano 0) 'Z)
  (test-equal? "nat->peano_1" (nat->peano 1) '(S Z))
  (test-equal? "nat->peano_2" (nat->peano 2) '(S (S 2)))
  (test-equal? "nat->peano_3" (nat->peano 3) '(S (S (S Z)))))

(: peano->nat (N -> Natural))
;; Convert Peano to natural
(define (peano->nat n) 0)

(module+ test
  (test-equal? "peano->nat_0" (peano->nat 'Z) 0)
  (test-equal? "peano->nat_1" (peano->nat '(S Z)) 1)
  (test-equal? "peano->nat_2" (peano->nat '(S (S Z))) 2)
  (test-equal? "peano->nat_3" (peano->nat '(S (S (S Z)))) 3))

;; Do not use conversions to implement the following functions

(: plus (N N -> N))
;; Add two Peano numbers together
(define (plus n1 n2) 'Z)

(module+ test
  (test-equal? "plus_0" (plus 'Z 'Z) 'Z)
  (test-equal? "plus_1" (plus 'Z '(S Z)) '(S Z))
  (test-equal? "plus_2" (plus '(S Z) 'Z) '(S Z))
  (test-equal? "plus_3" (plus '(S Z) '(S Z)) '(S (S Z))))

(: mult (N N -> N))
;; Multiply two Peano numbers together
(define (mult n1 n2) 'Z)

(module+ test
  (test-equal? "mult_0" (plus 'Z 'Z) 'Z)
  (test-equal? "mult_1" (plus 'Z '(S Z)) 'Z)
  (test-equal? "mult_2" (plus '(S Z) 'Z) 'Z)
  (test-equal? "mult_3" (plus '(S Z) '(S Z)) '(S Z)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Binary trees of numbers

;; Write test cases for each function (before writing code!).

(define-type BTNumber
  (U 'leaf
     (List Number BTNumber BTNumber)))

(: btn-height (BTNumber -> Natural))
;; Compute the height of a binary tree (leaf has height 0)
(define (btn-height bt) 0)

(module+ test
  (test-equal? "btn-height_0" (btn-height 'leaf) 0)
  (test-equal? "btn-height_1" (btn-height '(5 leaf leaf)) 1)
  (test-equal? "btn-height_2" (btn-height '(5 (1 leaf leaf) leaf)) 2))

(: btn-count (BTNumber -> Natural))
;; Count the numbers of a binary tree
(define (btn-count bt) 0)

(: btn-mirror (BTNumber -> BTNumber))
;; Compute the mirror image of binary tree
(define (btn-mirror bt) bt)

(: btn-sum (BTNumber -> Number))
;; Sum the numbers of a binary tree
(define (btn-sum bt) 0)

(: btn-gen-full (Natural Number -> BTNumber))
;; Generate a full bt of height h containing given number n at each node
(define (btn-gen-full h n) 'leaf)

;; A BSTNumber is a BTNumber with the binary search tree property
(define-type BSTNumber BTNumber)

(: btn-bstn? (BTNumber -> Boolean))
;; Does the bt have the binary search tree property?
(define (btn-bstn? bt) #false)

(: bstn-contains? (BSTNumber Number -> Boolean))
;; Does bst contain given number?
(define (bstn-contains? bst n) #false)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Binary trees (parametric)

;; Write test cases for each function (before writing code!).
;; Write type signatures.

(define-type [BT α]
  (U 'leaf
     (List Number [BT α] [BT α])))

;; Compute the height of a binary tree (leaf has height 0)
(define (bt-height bt) 0)

;; Count the numbers of a binary tree
(define (bt-count bt) 0)

;; Compute the mirror image of binary tree
(define (bt-mirror bt) bt)

;; Generate a full bt of height h containing given number n at each node
(define (bt-gen-full h n) 'leaf)

;; A [BST α] is a [BT α] with the binary search tree property (according to some order)
(define-type [BST α] [BT α])

(define-type [Comparator α] (α α -> Boolean))
(define-type [Equal α] (α α -> Boolean))

;; Does the bt have the binary search tree property using given order?
(define (bt-bst? bt <) #false)

;; Does bst contain given element equal with a?
;; ASSUME: bst has bst property wrt < and = is consistent with <.
(define (bst-contains? bst a < =) #false)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO

;; - vectors
;; - Hashtable (ADT)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Understanding
#|

   Give a brief English description of each of the following types or type
   constructors:
   - Listof
   - List
   - Boolean
   - #true
   - Pairof
   - Real
   - Natural
   - Number
   - Symbol
   - 'leaf
   - U
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
