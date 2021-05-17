
(cl:in-package :asdf)

(defsystem "demo_service_python-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "python_srv" :depends-on ("_package_python_srv"))
    (:file "_package_python_srv" :depends-on ("_package"))
  ))