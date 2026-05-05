(defpackage :difference-of-squares
  (:use :cl)
  (:export :sum-of-squares
           :square-of-sum
           :difference))

(in-package :difference-of-squares)

(defun square-of-sum (n)
  "Calculates the square of the sum for a given number."
  (let ((first-sum (loop for s from 1 to n
        sum s)))
       (expt first-sum 2)
  ))

(defun sum-of-squares (n)
  "Calculates the sum of squares for a given number."
  (loop for s from 1 to n
        sum (expt s 2)))

(defun difference (n)
  "Finds the diff. between the square of the sum and the sum of the squares."
  (- (square-of-sum n)  (sum-of-squares n))
  )
