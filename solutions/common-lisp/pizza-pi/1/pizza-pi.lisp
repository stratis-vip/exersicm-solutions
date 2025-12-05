(defpackage :pizza-pi
  (:use :cl)
  (:export :dough-calculator :pizzas-per-cube
           :size-from-sauce :fair-share-p))

(in-package :pizza-pi)

(defun dough-calculator (pizzas diameter)
  (round (* pizzas (+ (/ (* 45 pi diameter) 20) 200)))
  )

(defun size-from-sauce (sauce)
  (sqrt (/ (* 40 sauce) (* 3 pi)))
  )

(defun pizzas-per-cube (cube-size diameter)
  (floor (/ (* 2 (* cube-size cube-size cube-size)) (* 3 pi (* diameter diameter))))
  )

(defun fair-share-p (pizzas friends)
  (if (= (mod (* pizzas 8) friends) 0) 
      t
      nil
      )
  )
