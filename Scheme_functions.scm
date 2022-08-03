  ;;==1==
  ;; (byTwos n m) returns the list of integers starting with n up to m,
  ;; and each successive element is two greater than the previous element.
  ;; Base Case:  if n > m, then return a empty list "nil", which is '()
  ;; Hypothesis: Assume (byTwos (+ n 2) m) works, returning the list of each
  ;;             element from n+2 to m.
  ;; Recursive Step: (byTwos n m) return (cons n (byTwos (+ n 2) m))

(define (byTwos n m)
  (cond ((> n m) '())
        (else (cons n (byTwos (+ n 2) m)))))

'==1==
(byTwos 1 20)


  ;;==2==
  ;; (compress L) returns a list of all the non-list or nested list values in L.
  ;; Base Case:  if L is empty then return a empty list "nil", which is '().
  ;; Hypothesis: Assume (compress L1) works for any list L1 smaller than L.
  ;; Recursive Step: (compress L) returns (cons (car L) (compress (cdr L)))
  ;;                 if (car L) is not a list; otherwise, (compress L)
  ;;                 returns (append (compress (car L)) (compress (cdr L))).

(define (compress L)
    (if (null? L) '()
          (if (list? (car L))
               (append (compress (car L)) (compress (cdr L)))
               (cons (car L) (compress (cdr L))))))

'==2==
(compress '(1 (2 3 (4 5) (6 7 (8)) 9) 10))


  ;;==3==
  ;; (rev-all L) reverses the elements of a list L, including those elements in the nested lists.
  ;; Base Case: if L is null, then return a empty list '().
  ;; Hypothesis: (rev-all L1) will work if L1 is smaller than L
  ;; Recursive Step: using the helper function, if (cdr old) is a list,
  ;;                 then call (rev (cdr old) (cons (rev (car old) '()) new)); 
  ;;                 otherwise, call (rev (cdr old) (cons (car old) new))

(define (rev old new)
  (cond ((null? old) new)
        (else (if (list? (car old))
             (rev (cdr old) (cons (rev (car old) '()) new))
             (rev (cdr old) (cons (car old) new))))))

(define (rev-all L) (rev L '()))

'==3==
(rev-all '(1 2 (3 4) (5 6 (7 8) 9) 10))


  ;;==4==
  ;; (equalTo? x y) returns #t if x is equal to y; otherwise, returns #f.
  ;; Base Case:  if (pair? x) and (pair? y) are both false, meaning they are atoms, then call (eq? x y).
  ;; Hypothesis: Assume (equalTo? x1 y1) works for any atoms x1 and y1 smaller than x and y.
  ;; Recursive Step: if x and y are both non-empty lists, then compare the (car x) and (car y)
  ;;                 and call (equalTo? (cdr x) (cdr y) to see if the rest of atoms are equal.

(define (equalTo? x y)
  (cond ((and (pair? x) (pair? y)) (and (eq? (car x) (car y)) (equalTo? (cdr x) (cdr y))))
        (else (eq? x y))))

'==4==
(equalTo? '(1 2 3) '(1 2 3))
(equalTo? 'hello 'hell0)
(equalTo? 'hello 'goodbye)
(equalTo? 3 3)
(equalTo? 3 4)


  ;;==5==
  ;; (euqalFns? fn1 fn2 domain) returns #t if fn1 and fn2 always returns the same value when applied to the same element of domain
  ;; Base Case:  If the parameter "domain" is null, then returns #t.
  ;; Hypothesis: Assume (equalFns? fn1 fn2 domain1) works for any domain1 smaller than domain.
  ;; Recursive Step: Compare the return values of fn1 and fn2 for first element of the domain,
  ;;                 if they are equal, then keeps comparing the next element of the domain; otherwise, returns #f.

(define (equalFns? fn1 fn2 domain)
  (cond ((null? domain) #t)
        (else (if (equal? (fn1 (car domain)) (fn2 (car domain)))
                  (equalFns? fn1 fn2 (cdr domain)) #f))))

'==5==
(equalFns? (lambda (x) (* x 2)) (lambda (y) (+ y y)) '(1 2 3 4 5 6 7 8 9 10 11 12))
(equalFns? (lambda (x) (* x 2)) (lambda (y) (+ y 2)) '(2))
(equalFns? (lambda (L) (car L)) (lambda (L) (cadr L)) '(((2 3) (2 3)) ((4 5) (4 5))))
(equalFns? (lambda (x) (* x 2)) (lambda (y) (+ y 2)) '(2 3 4 5))


  ;;==6==
  ;; (same-vals fn1 fn2 domain) returns the list of all elements x of domain such that (fn1 x) and (fn2 x) return the same value.
  ;; Base Case:  If the parameter "domain" is null, then returns '().
  ;; Hypothesis: Assume (equalFns? fn1 fn2 domain1) works for any domain1 smaller than domain.
  ;; Recursive Step: Compare the return values of fn1 and fn2 for first element of the domain,
  ;;                 if they are equal, then keeps comparing the next element of the domain; otherwise, returns #f.

(define (same-vals fn1 fn2 domain)
  (cond ((null? domain) '())
        (else (if (equal? (fn1 (car domain)) (fn2 (car domain)))
                  (cons (fn1 (car domain)) (same-vals fn1 fn2 (cdr domain)))
                  (same-vals fn1 fn2 (cdr domain))))))

'==6==
(same-vals (lambda (x) x) (lambda (y) (abs y))  ;; abs give the absolute value
                 '(-3 -2 -1 0 1 2 3))


  ;;==7==
  ;; (split x L) returns a list containing two lists: The first list contains the numbers in L less than or equal to x
  ;;                                                  and the second list contains the numbers in L greater than x.
  ;; Base Case:  If L is an empty list, then returns (list '() '()).
  ;; Hypothesis: Assume (split x L1) works for any L1 smaller than L.
  ;; Recursive Step: If (car L), which is variable "a", is bigger than x,
  ;;                 then calls (split x (cdr L)), variable "res", and lists them together.

  ;;(let ((var1 exp1) ... (varN expN)) body) --> take it out put it in and list it

(define (split x L)
  (cond ((null? L) (list '() '()))
        (else (if (>= x (car L))
                  (let ((a (car L)) (res (split x (cdr L)))) (list (cons a (car res)) (cadr res)))
                  (let ((a (car L)) (res (split x (cdr L)))) (list (car res) (cons a (cadr res))))))))

'==7==
(split 6 '(1 9 2 8 3 10 4 6 5))


  ;;==8==
  ;; (psort L) implements a partition sort, and the sorted result is constructed from the elements of the two sorted lists
  ;; , as well as the first element of L.
  ;; Base Case:  If L is an empty list, then returns '().
  ;; Hypothesis: Assume (psort L1) works for any L1 smaller than L.
  ;; Recursive Step: 

(define (psort L)
  (cond ((null? L) '())
        (else (let ((res (split (car L) (cdr L))) (p (car L))) (append (psort (car res)) (cons p (psort(cadr res))))))))

'==8==
(psort '(5 3 8 6 1 0 2))


 ;;==9==
 ;; (applyToList f) returns a 'function' that takes a list L as a parameter and applies f to evey element of L,
 ;; returning the resulting list as the result.

(define (applyTolist f)
  (lambda (L) (map f L)))

'==9==
(define g (applyToList (lambda (x) (* x 2))))
(g '(1 2 3 4 5))
((applyToList (lambda (y) (car y))) '((1 2 3) (4 5 6) (7 8 9)))


 ;;==10==
 ;; (newApplyToList f) behaves exactly like applyToList above,
 ;; except that you cannot use the built-in map or any other built-in function except cons, car, cdr, and helper functions.

(define (newApplyToList f) (letrec ((g (lambda (L) ((cond ((null? L) '())
                                                (else (cons (f (car L)) (g (cdr L))))))))
) (g L)))

 ;;;; myMAP
 ;;(define (myMap f L)
 ;; (cond ((null? L) '())
 ;;       (else (cons (f (car L))  (myMap f (cdr L))))))
 ;;;; ((lambda (x y) (+ x y)) 6 8)
 ;;map

;;(define (newApplyToList f) (lambda (f L) ((cond ((null? L) '())
;;                                                (else (cons (f (car L)) (newApplyToList (cdr L))))
;; ))))

;;(define (newApplyToList f) (letrec ((g (lambda (f) ((cond ((null? L) '())
;;                                                (else (cons (f (car L)) (h (f (cdr L)))))))))
;;                                    (h (lambda (f) ((cond ((null? L) '())
;;                                                (else (cons (f (car L)) (g (f (cdr L)))))))))
;;) (g f)))

;;(define (newApplyToList f) (lambda (f L) ((g (lambda (f L) ((cond ((null? L) '())
;;                                                (else (cons (f (car L)) (h (f (cdr L)))))))))
;;                            (h (lambda (f L) ((cond ((null? L) '())
;;                                                (else (cons (f (car L)) (g (f (cdr L)))))))))
;;)) f L)

;;(define (newApplyToList f) (let (((F f) (l L)) (lambda (f (let l L)) ((cond ((null? l) '())
;;                                                        (else (cons (f (car l)) (newApplyToList (cdr l))))))
;;                                ))
;;                           )
;;)

'==10==
(define g (applyToList (lambda (x) (* x 2))))
(g '(1 2 3 4 5))
((applyToList (lambda (y) (car y))) '((1 2 3) (4 5 6) (7 8 9)))
