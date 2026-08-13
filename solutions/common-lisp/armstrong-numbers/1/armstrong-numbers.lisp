(defpackage :armstrong-numbers
  (:use :cl)
  (:export :armstrong-number-p))
(in-package :armstrong-numbers)

(defun armstrong-number-p (number)
  (cond 
    ((< 0 number 10) t) ;;all numbers 
    (t (= (sum (sum-of-power number)) number))))

 (defun sum (lst) (reduce #'+ lst))

 (defun sum-of-power (number)
	       (let* ((char-num (format nil "~d" number))
		      (len (length char-num)))
		 (mapcar (lambda (x) (expt  (- (char-code x) (char-code #\0)) len)) (coerce  char-num 'list))  ))