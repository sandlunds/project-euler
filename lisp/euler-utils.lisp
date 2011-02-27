;;;; euler-utils.lisp

(in-package #:euler-utils)

;;; prime number related

(defun primep (x)
  "Predicate to test the primality of x."
  (let ((sqrt-x (sqrt x)))
    (do ((i 2 (1+ i)))
        ((> i sqrt-x) t)
      (when (eq (mod x i) 0)
	(return nil)))))

(defun next-prime (n)
  (if (primep (1+ n))
      (1+ n)
      (next-prime (1+ n))))

(defun primes (n)
  "Returns the n first primes."
  (iter (repeat n)
	(for p initially 2 then (next-prime p))
	(collect p)))

(defun prime-factors (n &optional (p 2))
  (if (primep n)
      (list n)
      (if (= 0 (mod n p))
	  (cons p (prime-factors (/ n p) p))
	  (prime-factors n (next-prime p)))))

(defun sieve-of-eratosthenes (maximum)
  (let ((composites (make-array (1+ maximum) 
				:element-type 'bit
				:initial-element 0)))
    (loop for candidate from 2 to maximum
       when (zerop (bit composites candidate))
       collect candidate
       and do (loop for composite from (expt candidate 2) to maximum by candidate
		 do (setf (bit composites composite) 1)))))

;;; other stuff.

(defun palindromep (n)
  (let ((s (write-to-string n)))
    (do ((i 0 (1+ i))
	 (j (1- (length s)) (1- j)))
	((>= i j) t)
      (when (not (eql (char s i)
		      (char s j)))
	(return)))))


(defun square (n)
  (* n n))

(defun digits (n)
  (labels ((digits-reversed (n)
	     (if (<= n 9)
		 (list n)
		 (cons (mod n 10)
		       (digits-reversed (floor (/ n 10)))))))
    (reverse (digits-reversed n))))

(defun triangle (n)
  (iter (for i from 1 to n) 
	(summing i)))

(defun divisors (n)
  (iter (for d from 1 to (floor (sqrt n)))
	(when (= 0 (mod n d))
	  (collect d)
	  (collect (/ n d)))))

(defun number-of-divisors (n)
  (iter (for d from 1 to (floor (sqrt n)))
	(when (= 0 (mod n d))
	  (summing 2))))
	    