(in-package :cl-user)
(defpackage jonathan.error
  (:use :cl)
  (:export :<jonathan-unexpected-eof-error>
           :<jonathan-incomplete-json-error>))
(in-package :jonathan.error)

(define-condition <jonathan-unexpected-eof-error> (simple-error)
  ((object :initarg :object))
  (:report
   (lambda (condition stream)
     (with-slots ((object object)) condition
       (format stream "Unexpected EOF found:~%~a~%" object)))))

(define-condition <jonathan-incomplete-json-error> (simple-error)
  ((object :initarg :object))
  (:report
   (lambda (condition stream)
     (with-slots ((object object)) condition
       (format stream "Incomplete JSON string:~%~a~%" object)))))