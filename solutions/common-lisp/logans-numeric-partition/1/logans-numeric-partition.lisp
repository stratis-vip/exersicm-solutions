(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)

;; Define categorize-number function
(defun categorize-number (lst number)
  (cond
    ((oddp number)
     ;; add number to the odd list (car)
     (setf (car lst) (cons number (car lst)))
     lst)

    ((evenp number)
     ;; add number to the even list (cdr)
     (setf (cdr lst) (cons number (cdr lst)))
     lst)

    (t lst)))

;; Define partition-numbers funct
(defun partition-numbers (numbers)
  (reduce (lambda (acc x)
            (categorize-number acc x))
          numbers
          :initial-value (cons '() '())))