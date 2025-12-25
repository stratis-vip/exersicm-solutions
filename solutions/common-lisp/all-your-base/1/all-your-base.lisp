(defpackage :all-your-base
  (:use :cl)
  (:export :rebase))

(in-package :all-your-base)

(defun from-base-to-decimal (base lst &optional (accumulator 0))
  (let ((acc (+ accumulator (first lst))))
    (if (null (rest lst))
	acc
	(from-base-to-decimal base (rest lst) (* acc base)))))
	     
(defun from-decimal-to-base (base num &optional (accumulator ()))
  (cond ((zerop num) (if (null accumulator) '(0) accumulator))
	(t (let*
	       ((rm (floor (/ num base)))
		(dv (mod num base))
		(acc (cons dv accumulator)))
	     (from-decimal-to-base base rm acc)))))

(defun check-limits (x base)
  (and
   (> base 1)
   (< x base)
   (>= x 0)))

(defun check-list (base lst)
  (every #'identity (mapcar #'(lambda (n) (check-limits n base)) lst)))

(defun rebase (list-digits in-base out-base)
  (cond
    ((not (check-list in-base list-digits)) nil)
    ((or (< in-base 2) (< out-base 2)) nil)
    ((null list-digits) '(0))
    (t
     (let ((dec (from-base-to-decimal in-base list-digits)))
       (from-decimal-to-base out-base dec)))))