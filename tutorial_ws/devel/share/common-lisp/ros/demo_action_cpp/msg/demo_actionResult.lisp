; Auto-generated. Do not edit!


(cl:in-package demo_action_cpp-msg)


;//! \htmlinclude demo_actionResult.msg.html

(cl:defclass <demo_actionResult> (roslisp-msg-protocol:ros-message)
  ((final_count
    :reader final_count
    :initarg :final_count
    :type cl:integer
    :initform 0))
)

(cl:defclass demo_actionResult (<demo_actionResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <demo_actionResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'demo_actionResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name demo_action_cpp-msg:<demo_actionResult> is deprecated: use demo_action_cpp-msg:demo_actionResult instead.")))

(cl:ensure-generic-function 'final_count-val :lambda-list '(m))
(cl:defmethod final_count-val ((m <demo_actionResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo_action_cpp-msg:final_count-val is deprecated.  Use demo_action_cpp-msg:final_count instead.")
  (final_count m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <demo_actionResult>) ostream)
  "Serializes a message object of type '<demo_actionResult>"
  (cl:let* ((signed (cl:slot-value msg 'final_count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <demo_actionResult>) istream)
  "Deserializes a message object of type '<demo_actionResult>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'final_count) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<demo_actionResult>)))
  "Returns string type for a message object of type '<demo_actionResult>"
  "demo_action_cpp/demo_actionResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'demo_actionResult)))
  "Returns string type for a message object of type 'demo_actionResult"
  "demo_action_cpp/demo_actionResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<demo_actionResult>)))
  "Returns md5sum for a message object of type '<demo_actionResult>"
  "eaae876f57686d9f2a92f60bfbd26c85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'demo_actionResult)))
  "Returns md5sum for a message object of type 'demo_actionResult"
  "eaae876f57686d9f2a92f60bfbd26c85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<demo_actionResult>)))
  "Returns full string definition for message of type '<demo_actionResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%int32 final_count~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'demo_actionResult)))
  "Returns full string definition for message of type 'demo_actionResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%int32 final_count~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <demo_actionResult>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <demo_actionResult>))
  "Converts a ROS message object to a list"
  (cl:list 'demo_actionResult
    (cl:cons ':final_count (final_count msg))
))
