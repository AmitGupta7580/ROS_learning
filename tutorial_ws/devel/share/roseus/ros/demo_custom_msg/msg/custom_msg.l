;; Auto-generated. Do not edit!


(when (boundp 'demo_custom_msg::custom_msg)
  (if (not (find-package "DEMO_CUSTOM_MSG"))
    (make-package "DEMO_CUSTOM_MSG"))
  (shadow 'custom_msg (find-package "DEMO_CUSTOM_MSG")))
(unless (find-package "DEMO_CUSTOM_MSG::CUSTOM_MSG")
  (make-package "DEMO_CUSTOM_MSG::CUSTOM_MSG"))

(in-package "ROS")
;;//! \htmlinclude custom_msg.msg.html


(defclass demo_custom_msg::custom_msg
  :super ros::object
  :slots (_name _number ))

(defmethod demo_custom_msg::custom_msg
  (:init
   (&key
    ((:name __name) "")
    ((:number __number) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _number (round __number))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:number
   (&optional __number)
   (if __number (setq _number __number)) _number)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; int32 _number
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32 _number
       (write-long _number s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _number
     (setq _number (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get demo_custom_msg::custom_msg :md5sum-) "2b67238d624be977c27607899c0cdedf")
(setf (get demo_custom_msg::custom_msg :datatype-) "demo_custom_msg/custom_msg")
(setf (get demo_custom_msg::custom_msg :definition-)
      "string name
int32 number
")



(provide :demo_custom_msg/custom_msg "2b67238d624be977c27607899c0cdedf")


