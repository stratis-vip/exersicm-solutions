(defpackage :lillys-lasagna-leftovers
  (:use :cl)
  (:export
   :preparation-time
   :remaining-minutes-in-oven
   :split-leftovers))

(in-package :lillys-lasagna-leftovers)

;; Define function preparation-time
(defun preparation-time (&rest layers)
  (if (null layers)
      0
      (* 19 (length layers))
      )
  )

;; Define function remaining-minutes-in-oven
(defun remaining-minutes-in-oven (&optional (period 337))
  (cond   
    ((eql period :normal) 337)
    ((eql period :shorter) 237)
    ((eql period :very-short) 137)
    ((eql period :longer) 437)
    ((eql period :very-long) 537)
    ((null period) 0)
    (t 337)
    )
  )
;; Define function split-leftovers
(defun split-leftovers (&key (weight 0) (human 0) (alien 0))
  (cond 
    ((null weight) :looks-like-someone-was-hungry)
    ((= weight 0) :just-split-it)
    ((= human 0) alien)
    ((= alien 0) human)
    (t (- weight (+ human alien)))
    )
  )