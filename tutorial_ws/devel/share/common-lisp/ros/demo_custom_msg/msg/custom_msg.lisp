; Auto-generated. Do not edit!


(cl:in-package demo_custom_msg-msg)


;//! \htmlinclude custom_msg.msg.html

(cl:defclass <custom_msg> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (number
    :reader number
    :initarg :number
    :type cl:integer
    :initform 0))
)

(cl:defclass custom_msg (<custom_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <custom_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'custom_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name demo_custom_msg-msg:<custom_msg> is deprecated: use demo_custom_msg-msg:custom_msg instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <custom_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo_custom_msg-msg:name-val is deprecated.  Use demo_custom_msg-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'number-val :lambda-list '(m))
(cl:defmethod number-val ((m <custom_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo_custom_msg-msg:number-val is deprecated.  Use demo_custom_msg-msg:number instead.")
  (number m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <custom_msg>) ostream)
  "Serializes a message object of type '<custom_msg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'number)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <custom_msg>) istream)
  "Deserializes a message object of type '<custom_msg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'number) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<custom_msg>)))
  "Returns string type for a message object of type '<custom_msg>"
  "demo_custom_msg/custom_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'custom_msg)))
  "Returns string type for a message object of type 'custom_msg"
  "demo_custom_msg/custom_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<custom_msg>)))
  "Returns md5sum for a message object of type '<custom_msg>"
  "2b67238d624be977c27607899c0cdedf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'custom_msg)))
  "Returns md5sum for a message object of type 'custom_msg"
  "2b67238d624be977c27607899c0cdedf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<custom_msg>)))
  "Returns full string definition for message of type '<custom_msg>"
  (cl:format cl:nil "string name~%int32 number~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'custom_msg)))
  "Returns full string definition for message of type 'custom_msg"
  (cl:format cl:nil "string name~%int32 number~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <custom_msg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <custom_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'custom_msg
    (cl:cons ':name (name msg))
    (cl:cons ':number (number msg))
))
