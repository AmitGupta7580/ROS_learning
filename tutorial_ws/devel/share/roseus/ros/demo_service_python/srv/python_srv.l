;; Auto-generated. Do not edit!


(when (boundp 'demo_service_python::python_srv)
  (if (not (find-package "DEMO_SERVICE_PYTHON"))
    (make-package "DEMO_SERVICE_PYTHON"))
  (shadow 'python_srv (find-package "DEMO_SERVICE_PYTHON")))
(unless (find-package "DEMO_SERVICE_PYTHON::PYTHON_SRV")
  (make-package "DEMO_SERVICE_PYTHON::PYTHON_SRV"))
(unless (find-package "DEMO_SERVICE_PYTHON::PYTHON_SRVREQUEST")
  (make-package "DEMO_SERVICE_PYTHON::PYTHON_SRVREQUEST"))
(unless (find-package "DEMO_SERVICE_PYTHON::PYTHON_SRVRESPONSE")
  (make-package "DEMO_SERVICE_PYTHON::PYTHON_SRVRESPONSE"))

(in-package "ROS")





(defclass demo_service_python::python_srvRequest
  :super ros::object
  :slots (_a _b ))

(defmethod demo_service_python::python_srvRequest
  (:init
   (&key
    ((:a __a) 0)
    ((:b __b) 0)
    )
   (send-super :init)
   (setq _a (round __a))
   (setq _b (round __b))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:serialization-length
   ()
   (+
    ;; int32 _a
    4
    ;; int32 _b
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _a
       (write-long _a s)
     ;; int32 _b
       (write-long _b s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _a
     (setq _a (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _b
     (setq _b (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass demo_service_python::python_srvResponse
  :super ros::object
  :slots (_sum ))

(defmethod demo_service_python::python_srvResponse
  (:init
   (&key
    ((:sum __sum) 0)
    )
   (send-super :init)
   (setq _sum (round __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; int32 _sum
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sum
       (write-long _sum s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sum
     (setq _sum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass demo_service_python::python_srv
  :super ros::object
  :slots ())

(setf (get demo_service_python::python_srv :md5sum-) "f0b6d69ea10b0cf210cb349d58d59e8f")
(setf (get demo_service_python::python_srv :datatype-) "demo_service_python/python_srv")
(setf (get demo_service_python::python_srv :request) demo_service_python::python_srvRequest)
(setf (get demo_service_python::python_srv :response) demo_service_python::python_srvResponse)

(defmethod demo_service_python::python_srvRequest
  (:response () (instance demo_service_python::python_srvResponse :init)))

(setf (get demo_service_python::python_srvRequest :md5sum-) "f0b6d69ea10b0cf210cb349d58d59e8f")
(setf (get demo_service_python::python_srvRequest :datatype-) "demo_service_python/python_srvRequest")
(setf (get demo_service_python::python_srvRequest :definition-)
      "int32 a
int32 b
---
int32 sum
")

(setf (get demo_service_python::python_srvResponse :md5sum-) "f0b6d69ea10b0cf210cb349d58d59e8f")
(setf (get demo_service_python::python_srvResponse :datatype-) "demo_service_python/python_srvResponse")
(setf (get demo_service_python::python_srvResponse :definition-)
      "int32 a
int32 b
---
int32 sum
")



(provide :demo_service_python/python_srv "f0b6d69ea10b0cf210cb349d58d59e8f")


