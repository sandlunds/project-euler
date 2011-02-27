;;;; project-euler.asd

(asdf:defsystem #:project-euler
  :serial t
  :components ((:file "package")
	       (:file "euler-utils")
               (:file "project-euler"))
  :depends-on ("iterate"))

