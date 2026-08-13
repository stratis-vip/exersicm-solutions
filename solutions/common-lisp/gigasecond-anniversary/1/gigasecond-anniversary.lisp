(defpackage :gigasecond-anniversary
  (:use :cl)
  (:export :from))
(in-package :gigasecond-anniversary)



(defun from (year month day hour minute second)
  (let* ((start (encode-universal-time second minute hour day month year))
         (target (+ start (expt 10 9))))
    (multiple-value-bind (sec min hou da mon yea)
        (decode-universal-time target)
      (list yea mon da hou min sec))))