(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

;; Define function expected-time-in-oven
(defun expected-time-in-oven ()
  "expected-time-in-oven"
  337
  )

;; Define function remaining-minutes-in-oven
(defun remaining-minutes-in-oven (minutes)
  "remaining-minutes-in-oven"
  (- 337 minutes)
  )

;; Define function preparation-time-in-minutes
(defun preparation-time-in-minutes (layers)
  "preparation-time-in-minutes"
  (* layers 19)
  )
;; Define function elapsed-time-in-minutes
(defun elapsed-time-in-minutes (layers minutes)
  "elapsed-time-in-minutes"
  (+ (preparation-time-in-minutes layers) minutes) 
  )