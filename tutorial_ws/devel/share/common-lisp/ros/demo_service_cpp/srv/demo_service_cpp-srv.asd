
(cl:in-package :asdf)

(defsystem "demo_service_cpp-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "simple_srv" :depends-on ("_package_simple_srv"))
    (:file "_package_simple_srv" :depends-on ("_package"))
  ))