(defpackage :grade-school
  (:use :cl)
  (:export :make-school :add :roster :grade))

(in-package :grade-school)

(defstruct school-struct
  name 
  grade)

(defun make-school ()
  (make-hash-table  :test #'equal))

(defun hash->list-names (school)
  (cond 
    ((zerop (hash-table-count school)) '())
    (t (loop for val being the hash-key of school
	       using (hash-value v)
             collect (format nil "~d~A"(school-struct-grade v) val)))))
 
(defun roster (school)
  (mapcar (lambda (x) (subseq x 1)) (sort (hash->list-names school) #'string<))
)

(defun grade (school grade)
  (cond  ((zerop (hash-table-count school)) '())
	 (t (sort (loop for val being the hash-value of school
			when (= (school-struct-grade val) grade )
			  collect (school-struct-name val))
		  #'string<))))

(defun add (school name grade)
  (if (gethash name school)
      nil 
      (setf (gethash name school) (make-school-struct :name name :grade grade) )))
