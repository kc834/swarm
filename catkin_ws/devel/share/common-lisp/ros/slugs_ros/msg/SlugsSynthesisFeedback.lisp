; Auto-generated. Do not edit!


(cl:in-package slugs_ros-msg)


;//! \htmlinclude SlugsSynthesisFeedback.msg.html

(cl:defclass <SlugsSynthesisFeedback> (roslisp-msg-protocol:ros-message)
  ((elapsed_time
    :reader elapsed_time
    :initarg :elapsed_time
    :type cl:float
    :initform 0.0))
)

(cl:defclass SlugsSynthesisFeedback (<SlugsSynthesisFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsSynthesisFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsSynthesisFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-msg:<SlugsSynthesisFeedback> is deprecated: use slugs_ros-msg:SlugsSynthesisFeedback instead.")))

(cl:ensure-generic-function 'elapsed_time-val :lambda-list '(m))
(cl:defmethod elapsed_time-val ((m <SlugsSynthesisFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-msg:elapsed_time-val is deprecated.  Use slugs_ros-msg:elapsed_time instead.")
  (elapsed_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsSynthesisFeedback>) ostream)
  "Serializes a message object of type '<SlugsSynthesisFeedback>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'elapsed_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsSynthesisFeedback>) istream)
  "Deserializes a message object of type '<SlugsSynthesisFeedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'elapsed_time) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsSynthesisFeedback>)))
  "Returns string type for a message object of type '<SlugsSynthesisFeedback>"
  "slugs_ros/SlugsSynthesisFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsSynthesisFeedback)))
  "Returns string type for a message object of type 'SlugsSynthesisFeedback"
  "slugs_ros/SlugsSynthesisFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsSynthesisFeedback>)))
  "Returns md5sum for a message object of type '<SlugsSynthesisFeedback>"
  "96ca6b8721a8bce34666176d169ab1f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsSynthesisFeedback)))
  "Returns md5sum for a message object of type 'SlugsSynthesisFeedback"
  "96ca6b8721a8bce34666176d169ab1f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsSynthesisFeedback>)))
  "Returns full string definition for message of type '<SlugsSynthesisFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# feedback~%float64 elapsed_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsSynthesisFeedback)))
  "Returns full string definition for message of type 'SlugsSynthesisFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# feedback~%float64 elapsed_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsSynthesisFeedback>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsSynthesisFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsSynthesisFeedback
    (cl:cons ':elapsed_time (elapsed_time msg))
))