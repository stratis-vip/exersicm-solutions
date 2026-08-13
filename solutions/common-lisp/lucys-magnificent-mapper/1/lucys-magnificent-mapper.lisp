(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

;; Define make-magnificent-maybe function
 (defun make-magnificent-maybe (func lst)
  (mapcar (lambda (x) (funcall func x)) lst))

;; Define only-the-best function
 (defun only-the-best (func lst)
  (remove-if (lambda (x) (or (= x 1 ) (funcall func x))) lst))
