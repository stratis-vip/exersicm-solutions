(defpackage :roman-numerals
  (:use :cl)
  (:export :romanize))

(in-package :roman-numerals)

(defun to-roman (n)
  (let ((values #(1000 900  500 400  100 90   50  40   10  9    5   4    1))
	(symbols #("M"  "CM" "D" "CD" "C" "XC" "L" "XL" "X" "IX" "V" "IV" "I")))
    (with-output-to-string (out)
      (loop for i from 0 below (length values)
	    for v = (aref values i)
	    for s = (aref symbols i)
	    do (loop while (>= n v) do
	      (write-string s out)
	      (decf n v))))))

(defun romanize (number)
  "Returns the Roman numeral representation for a given number."
  (to-roman number)
  )

