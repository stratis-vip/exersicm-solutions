(defpackage :larrys-winning-checker
  (:use :cl)
  (:export
   :make-empty-board
   :make-board-from-list
   :all-the-same-p
   :row
   :column))

(in-package :larrys-winning-checker)

(defun make-empty-board ()
  (make-array '(3 3) :initial-element nil))

(defun make-board-from-list (list)
  (make-array '(3 3) :initial-contents list)) 

(defun all-the-same-p (row-or-col)
  (= (count (aref row-or-col 0) row-or-col) 3) 
  )

(defun row (board row-num)
  (make-array 3
	      :initial-contents (loop for idx from 0 below (array-dimension board 1)
				      collect (aref board row-num idx))))
(defun column (board col-num)
  (make-array 3
	      :initial-contents (loop for idx from 0 below (array-dimension board 0)
				      collect (aref board idx col-num))))
