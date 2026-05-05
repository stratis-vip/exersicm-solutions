(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n)
  (labels ((rec (num counter)
	     (cond
	       ((or (< num 0) (zerop num)) nil)
	       ((= num 1 ) counter)
	       ((evenp num) (rec (/ num 2) (1+ counter)))
	       (t (rec (1+ (* num 3)) (1+ counter))))
	     ))
    (rec n 0)))