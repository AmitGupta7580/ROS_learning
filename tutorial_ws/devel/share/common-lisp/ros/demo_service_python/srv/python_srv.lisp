; Auto-generated. Do not edit!


(cl:in-package demo_service_python-srv)


;//! \htmlinclude python_srv-request.msg.html

(cl:defclass <python_srv-request> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:integer
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:integer
    :initform 0))
)

(cl:defclass python_srv-request (<python_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <python_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'python_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name demo_service_python-srv:<python_srv-request> is deprecated: use demo_service_python-srv:python_srv-request instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <python_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo_service_python-srv:a-val is deprecated.  Use demo_service_python-srv:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <python_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo_service_python-srv:b-val is deprecated.  Use demo_service_python-srv:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <python_srv-request>) ostream)
  "Serializes a message object of type '<python_srv-request>"
  (cl:let* ((signed (cl:slot-value msg 'a)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'b)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <python_srv-request>) istream)
  "Deserializes a message object of type '<python_srv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'b) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<python_srv-request>)))
  "Returns string type for a service object of type '<python_srv-request>"
  "demo_service_python/python_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'python_srv-request)))
  "Returns string type for a service object of type 'python_srv-request"
  "demo_service_python/python_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<python_srv-request>)))
  "Returns md5sum for a message object of type '<python_srv-request>"
  "f0b6d69ea10b0cf210cb349d58d59e8f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'python_srv-request)))
  "Returns md5sum for a message object of type 'python_srv-request"
  "f0b6d69ea10b0cf210cb349d58d59e8f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<python_srv-request>)))
  "Returns full string definition for message of type '<python_srv-request>"
  (cl:format cl:nil "int32 a~%int32 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'python_srv-request)))
  "Returns full string definition for message of type 'python_srv-request"
  (cl:format cl:nil "int32 a~%int32 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <python_srv-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <python_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'python_srv-request
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
))
;//! \htmlinclude python_srv-response.msg.html

(cl:defclass <python_srv-response> (roslisp-msg-protocol:ros-message)
  ((sum
    :reader sum
    :initarg :sum
    :type cl:integer
    :initform 0))
)

(cl:defclass python_srv-response (<python_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <python_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'python_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name demo_service_python-srv:<python_srv-response> is deprecated: use demo_service_python-srv:python_srv-response instead.")))

(cl:ensure-generic-function 'sum-val :lambda-list '(m))
(cl:defmethod sum-val ((m <python_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo_service_python-srv:sum-val is deprecated.  Use demo_service_python-srv:sum instead.")
  (sum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <python_srv-response>) ostream)
  "Serializes a message object of type '<python_srv-response>"
  (cl:let* ((signed (cl:slot-value msg 'sum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <python_srv-response>) istream)
  "Deserializes a message object of type '<python_srv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sum) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<python_srv-response>)))
  "Returns string type for a service object of type '<python_srv-response>"
  "demo_service_python/python_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'python_srv-response)))
  "Returns string type for a service object of type 'python_srv-response"
  "demo_service_python/python_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<python_srv-response>)))
  "Returns md5sum for a message object of type '<python_srv-response>"
  "f0b6d69ea10b0cf210cb349d58d59e8f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'python_srv-response)))
  "Returns md5sum for a message object of type 'python_srv-response"
  "f0b6d69ea10b0cf210cb349d58d59e8f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<python_srv-response>)))
  "Returns full string definition for message of type '<python_srv-response>"
  (cl:format cl:nil "int32 sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'python_srv-response)))
  "Returns full string definition for message of type 'python_srv-response"
  (cl:format cl:nil "int32 sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <python_srv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <python_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'python_srv-response
    (cl:cons ':sum (sum msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'python_srv)))
  'python_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'python_srv)))
  'python_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'python_srv)))
  "Returns string type for a service object of type '<python_srv>"
  "demo_service_python/python_srv")