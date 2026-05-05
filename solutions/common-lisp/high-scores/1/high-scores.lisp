(defpackage :high-scores
  (:use :cl)
  (:export :make-high-scores-table :add-player
           :set-score :get-score :remove-player))

(in-package :high-scores)

;; Define make-high-scores-table function
(defun make-high-scores-table ()
  (make-hash-table))

;; Define add-player function
(defun add-player (ht player)
  (setf (gethash player ht) 0))

;; Define set-score function
(defun set-score (ht player score)
  (setf (gethash player ht) score))

;; Define get-score function
(defun get-score (ht player)
 (if (gethash player ht)
     (gethash player ht)
     0)
  )

;; Define remove-player function
(defun remove-player (ht player)
  (remhash player ht))
