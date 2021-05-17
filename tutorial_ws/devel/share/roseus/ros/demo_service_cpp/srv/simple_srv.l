;; Auto-generated. Do not edit!


(when (boundp 'demo_service_cpp::simple_srv)
  (if (not (find-package "DEMO_SERVICE_CPP"))
    (make-package "DEMO_SERVICE_CPP"))
  (shadow 'simple_srv (find-package "DEMO_SERVICE_CPP")))
(unless (find-package "DEMO_SERVICE_CPP::SIMPLE_SRV")
  (make-package "DEMO_SERVICE_CPP::SIMPLE_SRV"))
(unless (find-package "DEMO_SERVICE_CPP::SIMPLE_SRVREQUEST")
  (make-package "DEMO_SERVICE_CPP::SIMPLE_SRVREQUEST"))
(unless (find-package "DEMO_SERVICE_CPP::SIMPLE_SRVRESPONSE")
  (make-package "DEMO_SERVICE_CPP::SIMPLE_SRVRESPONSE"))

(in-package "ROS")





(defclass demo_service_cpp::simple_srvRequest
  :super ros::object
  :slots (_in ))

(defmethod demo_service_cpp::simple_srvRequest
  (:init
   (&key
    ((:in __in) "")
    )
   (send-super :init)
   (setq _in (string __in))
   self)
  (:in
   (&optional __in)
   (if __in (setq _in __in)) _in)
  (:serialization-length
   ()
   (+
    ;; string _in
    4 (length _in)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _in
       (write-long (length _in) s) (princ _in s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _in
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _in (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass demo_service_cpp::simple_srvResponse
  :super ros::object
  :slots (_out ))

(defmethod demo_service_cpp::simple_srvResponse
  (:init
   (&key
    ((:out __out) "")
    )
   (send-super :init)
   (setq _out (string __out))
   self)
  (:out
   (&optional __out)
   (if __out (setq _out __out)) _out)
  (:serialization-length
   ()
   (+
    ;; string _out
    4 (length _out)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _out
       (write-long (length _out) s) (princ _out s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _out
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _out (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass demo_service_cpp::simple_srv
  :super ros::object
  :slots ())

(setf (get demo_service_cpp::simple_srv :md5sum-) "e21fb7853ad73d6d988d6371d4fed1e2")
(setf (get demo_service_cpp::simple_srv :datatype-) "demo_service_cpp/simple_srv")
(setf (get demo_service_cpp::simple_srv :request) demo_service_cpp::simple_srvRequest)
(setf (get demo_service_cpp::simple_srv :response) demo_service_cpp::simple_srvResponse)

(defmethod demo_service_cpp::simple_srvRequest
  (:response () (instance demo_service_cpp::simple_srvResponse :init)))

(setf (get demo_service_cpp::simple_srvRequest :md5sum-) "e21fb7853ad73d6d988d6371d4fed1e2")
(setf (get demo_service_cpp::simple_srvRequest :datatype-) "demo_service_cpp/simple_srvRequest")
(setf (get demo_service_cpp::simple_srvRequest :definition-)
      "string in
---
string out
")

(setf (get demo_service_cpp::simple_srvResponse :md5sum-) "e21fb7853ad73d6d988d6371d4fed1e2")
(setf (get demo_service_cpp::simple_srvResponse :datatype-) "demo_service_cpp/simple_srvResponse")
(setf (get demo_service_cpp::simple_srvResponse :definition-)
      "string in
---
string out
")



(provide :demo_service_cpp/simple_srv "e21fb7853ad73d6d988d6371d4fed1e2")


