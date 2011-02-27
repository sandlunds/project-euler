;;;; package.lisp

(defpackage #:euler-utils
  (:use #:cl #:iter)
  (:export #:primep #:next-prime #:palindromep #:prime-factors
	   #:square #:digits #:sieve-of-eratosthenes #:triangle
	   #:divisors #:number-of-divisors))

(defpackage #:project-euler
  (:use #:cl #:iter #:euler-utils)
  (:export #:all-problems))
