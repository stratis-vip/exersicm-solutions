(defpackage :character-study
  (:use :cl)
  (:export
   :compare-chars
   :size-of-char
   :change-size-of-char
   :type-of-char))
(in-package :character-study)

(defun compare-chars (char1 char2)
  (if (char= char1 char2)
      :equal-to
      (if (char> char1 char2)
          :greater-than
          :less-than)))

(defun size-of-char (char)
  (cond 
    ((upper-case-p char) :big)
    ((lower-case-p char) :small)
    (t :no-size)))

(defun change-size-of-char (char wanted-size)
  (if (eql wanted-size :small)
      (char-downcase char)
      (char-upcase char)))

(defun type-of-char (char)
  (cond 
    ((alpha-char-p char) :alpha)
    ((digit-char-p char) :numeric)
    ((char= char #\Space) :space)
    ((char= char #\Newline) :newline)
    (t :unknown)))
