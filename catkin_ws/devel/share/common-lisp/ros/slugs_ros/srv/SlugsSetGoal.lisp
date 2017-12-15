; Auto-generated. Do not edit!


(cl:in-package slugs_ros-srv)


;//! \htmlinclude SlugsSetGoal-request.msg.html

(cl:defclass <SlugsSetGoal-request> (roslisp-msg-protocol:ros-message)
  ((goal_id
    :reader goal_id
    :initarg :goal_id
    :type cl:integer
    :initform 0))
)

(cl:defclass SlugsSetGoal-request (<SlugsSetGoal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsSetGoal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsSetGoal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsSetGoal-request> is deprecated: use slugs_ros-srv:SlugsSetGoal-request instead.")))

(cl:ensure-generic-function 'goal_id-val :lambda-list '(m))
(cl:defmethod goal_id-val ((m <SlugsSetGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:goal_id-val is deprecated.  Use slugs_ros-srv:goal_id instead.")
  (goal_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsSetGoal-request>) ostream)
  "Serializes a message object of type '<SlugsSetGoal-request>"
  (cl:let* ((signed (cl:slot-value msg 'goal_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsSetGoal-request>) istream)
  "Deserializes a message object of type '<SlugsSetGoal-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal_id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsSetGoal-request>)))
  "Returns string type for a service object of type '<SlugsSetGoal-request>"
  "slugs_ros/SlugsSetGoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsSetGoal-request)))
  "Returns string type for a service object of type 'SlugsSetGoal-request"
  "slugs_ros/SlugsSetGoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsSetGoal-request>)))
  "Returns md5sum for a message object of type '<SlugsSetGoal-request>"
  "c81f0d6158d35853a2a0b98391969310")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsSetGoal-request)))
  "Returns md5sum for a message object of type 'SlugsSetGoal-request"
  "c81f0d6158d35853a2a0b98391969310")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsSetGoal-request>)))
  "Returns full string definition for message of type '<SlugsSetGoal-request>"
  (cl:format cl:nil "int64 goal_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsSetGoal-request)))
  "Returns full string definition for message of type 'SlugsSetGoal-request"
  (cl:format cl:nil "int64 goal_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsSetGoal-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsSetGoal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsSetGoal-request
    (cl:cons ':goal_id (goal_id msg))
))
;//! \htmlinclude SlugsSetGoal-response.msg.html

(cl:defclass <SlugsSetGoal-response> (roslisp-msg-protocol:ros-message)
  ((current_goal_id
    :reader current_goal_id
    :initarg :current_goal_id
    :type cl:integer
    :initform 0))
)

(cl:defclass SlugsSetGoal-response (<SlugsSetGoal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsSetGoal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsSetGoal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsSetGoal-response> is deprecated: use slugs_ros-srv:SlugsSetGoal-response instead.")))

(cl:ensure-generic-function 'current_goal_id-val :lambda-list '(m))
(cl:defmethod current_goal_id-val ((m <SlugsSetGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:current_goal_id-val is deprecated.  Use slugs_ros-srv:current_goal_id instead.")
  (current_goal_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsSetGoal-response>) ostream)
  "Serializes a message object of type '<SlugsSetGoal-response>"
  (cl:let* ((signed (cl:slot-value msg 'current_goal_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsSetGoal-response>) istream)
  "Deserializes a message object of type '<SlugsSetGoal-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current_goal_id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsSetGoal-response>)))
  "Returns string type for a service object of type '<SlugsSetGoal-response>"
  "slugs_ros/SlugsSetGoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsSetGoal-response)))
  "Returns string type for a service object of type 'SlugsSetGoal-response"
  "slugs_ros/SlugsSetGoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsSetGoal-response>)))
  "Returns md5sum for a message object of type '<SlugsSetGoal-response>"
  "c81f0d6158d35853a2a0b98391969310")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsSetGoal-response)))
  "Returns md5sum for a message object of type 'SlugsSetGoal-response"
  "c81f0d6158d35853a2a0b98391969310")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsSetGoal-response>)))
  "Returns full string definition for message of type '<SlugsSetGoal-response>"
  (cl:format cl:nil "int64 current_goal_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsSetGoal-response)))
  "Returns full string definition for message of type 'SlugsSetGoal-response"
  (cl:format cl:nil "int64 current_goal_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsSetGoal-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsSetGoal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsSetGoal-response
    (cl:cons ':current_goal_id (current_goal_id msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SlugsSetGoal)))
  'SlugsSetGoal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SlugsSetGoal)))
  'SlugsSetGoal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsSetGoal)))
  "Returns string type for a service object of type '<SlugsSetGoal>"
  "slugs_ros/SlugsSetGoal")