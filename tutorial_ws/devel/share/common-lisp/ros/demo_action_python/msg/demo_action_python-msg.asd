
(cl:in-package :asdf)

(defsystem "demo_action_python-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "python_actionAction" :depends-on ("_package_python_actionAction"))
    (:file "_package_python_actionAction" :depends-on ("_package"))
    (:file "python_actionActionFeedback" :depends-on ("_package_python_actionActionFeedback"))
    (:file "_package_python_actionActionFeedback" :depends-on ("_package"))
    (:file "python_actionActionGoal" :depends-on ("_package_python_actionActionGoal"))
    (:file "_package_python_actionActionGoal" :depends-on ("_package"))
    (:file "python_actionActionResult" :depends-on ("_package_python_actionActionResult"))
    (:file "_package_python_actionActionResult" :depends-on ("_package"))
    (:file "python_actionFeedback" :depends-on ("_package_python_actionFeedback"))
    (:file "_package_python_actionFeedback" :depends-on ("_package"))
    (:file "python_actionGoal" :depends-on ("_package_python_actionGoal"))
    (:file "_package_python_actionGoal" :depends-on ("_package"))
    (:file "python_actionResult" :depends-on ("_package_python_actionResult"))
    (:file "_package_python_actionResult" :depends-on ("_package"))
  ))