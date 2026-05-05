(defpackage :log-levels
  (:use :cl)
  (:export :log-message :log-severity :log-format))

(in-package :log-levels)

(defun log-message (log-string)
  (subseq log-string 8))

(defun log-severity (log-string)
  (let ((sev (string-downcase (subseq log-string 1 5))))
       (cond 
         ((string= sev "info") :everything-ok)
         ((string= sev "warn") :getting-worried)
         ((string= sev "ohno") :run-for-cover)
         (t nil))))

(defun log-format (log-string)
  (cond 
    ((eql (log-severity log-string) :everything-ok ) (string-downcase (log-message log-string)))
    ((eql (log-severity log-string) :getting-worried ) (string-capitalize (log-message log-string)))
    ((eql (log-severity log-string) :run-for-cover ) (string-upcase (log-message log-string)))))
