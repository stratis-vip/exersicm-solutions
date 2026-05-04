(defpackage :leslies-lists
  (:use :cl)
  (:export :new-list
           :list-of-things
           :add-to-list
           :first-thing
           :second-thing
           :third-thing
           :twenty-third-thing
           :remove-first-item
           :on-the-list-p
           :list-append
           :just-how-long
           :part-of-list
           :list-reverse))

(in-package :leslies-lists)

(defun new-list () nil)

(defun list-of-things (thing1 thing2 thing3)
  (list thing1 thing2 thing3))

(defun add-to-list (item list)
  (cons item list))

(defun first-thing (list)
  (car list))

(defun second-thing (list)
  (cadr list))

(defun third-thing (list)
  (caddr list))

(defun twenty-third-thing (lst)
  (labels ((rec (lst idx)
                (if (= idx 22)
                    (car lst)
                    (rec (cdr lst) (1+ idx)))))
          (rec lst 0))     
  )

(defun remove-first-item (list)
  (cdr list))

(defun list-append (list1 list2)
  (append list1 list2))

(defun just-how-long (list)
  (reduce (lambda ( acc x) (+ acc 1)) list :initial-value 0))
