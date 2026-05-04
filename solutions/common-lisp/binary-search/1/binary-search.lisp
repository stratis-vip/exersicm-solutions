(defpackage :binary-search
  (:use :cl)
  (:export :binary-find :value-error))

(in-package :binary-search)

(defun split-at (lst idx)
  (labels ((rec (rest i acc)
	     (cond
	       ((or (zerop i) (null rest)) (list (nreverse acc) rest))
	       ( t (rec (cdr rest) (1- i) (cons (car rest) acc))))))
    (rec lst idx nil)))

(defun binary-find (arr el)
  (labels ((rec (arr el counter)
	     (if (zerop (length arr))
		 nil
		 (let* ((idx (floor (/ (length arr) 2)))
			(left (subseq arr 0 idx))
			(right (subseq arr idx))
			(item (aref right 0)))
		   (cond
		     ((equalp item el) (+ counter idx))
		     ((< el item) (rec left el counter))
		     (t (rec (subseq right 1) el (+ counter idx 1 ))))))))
    (rec arr el 0)))


