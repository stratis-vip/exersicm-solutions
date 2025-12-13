(defpackage :leap
  (:use :cl)
  (:export :leap-year-p))

(in-package :leap)

(defun leap-year-p (year)
  (and 
   (check-div-is-zero year 4)
   (or (not (check-div-is-zero year 100))
       (check-div-is-zero year 400)
       )
   )
  )

(defun check-div-is-zero (a b)
  (zerop (mod a b)))