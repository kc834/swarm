; Auto-generated. Do not edit!


(cl:in-package slugs_ros-srv)


;//! \htmlinclude SlugsInitExecutionString-request.msg.html

(cl:defclass <SlugsInitExecutionString-request> (roslisp-msg-protocol:ros-message)
  ((init_inputs_outputs
    :reader init_inputs_outputs
    :initarg :init_inputs_outputs
    :type cl:string
    :initform ""))
)

(cl:defclass SlugsInitExecutionString-request (<SlugsInitExecutionString-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsInitExecutionString-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsInitExecutionString-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsInitExecutionString-request> is deprecated: use slugs_ros-srv:SlugsInitExecutionString-request instead.")))

(cl:ensure-generic-function 'init_inputs_outputs-val :lambda-list '(m))
(cl:defmethod init_inputs_outputs-val ((m <SlugsInitExecutionString-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:init_inputs_outputs-val is deprecated.  Use slugs_ros-srv:init_inputs_outputs instead.")
  (init_inputs_outputs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsInitExecutionString-request>) ostream)
  "Serializes a message object of type '<SlugsInitExecutionString-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'init_inputs_outputs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'init_inputs_outputs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsInitExecutionString-request>) istream)
  "Deserializes a message object of type '<SlugsInitExecutionString-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'init_inputs_outputs) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'init_inputs_outputs) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsInitExecutionString-request>)))
  "Returns string type for a service object of type '<SlugsInitExecutionString-request>"
  "slugs_ros/SlugsInitExecutionStringRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsInitExecutionString-request)))
  "Returns string type for a service object of type 'SlugsInitExecutionString-request"
  "slugs_ros/SlugsInitExecutionStringRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsInitExecutionString-request>)))
  "Returns md5sum for a message object of type '<SlugsInitExecutionString-request>"
  "78d9b180a6363989c4867d53ceedde9f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsInitExecutionString-request)))
  "Returns md5sum for a message object of type 'SlugsInitExecutionString-request"
  "78d9b180a6363989c4867d53ceedde9f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsInitExecutionString-request>)))
  "Returns full string definition for message of type '<SlugsInitExecutionString-request>"
  (cl:format cl:nil "string init_inputs_outputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsInitExecutionString-request)))
  "Returns full string definition for message of type 'SlugsInitExecutionString-request"
  (cl:format cl:nil "string init_inputs_outputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsInitExecutionString-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'init_inputs_outputs))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsInitExecutionString-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsInitExecutionString-request
    (cl:cons ':init_inputs_outputs (init_inputs_outputs msg))
))
;//! \htmlinclude SlugsInitExecutionString-response.msg.html

(cl:defclass <SlugsInitExecutionString-response> (roslisp-msg-protocol:ros-message)
  ((current_inputs_outputs
    :reader current_inputs_outputs
    :initarg :current_inputs_outputs
    :type cl:string
    :initform ""))
)

(cl:defclass SlugsInitExecutionString-response (<SlugsInitExecutionString-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsInitExecutionString-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsInitExecutionString-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsInitExecutionString-response> is deprecated: use slugs_ros-srv:SlugsInitExecutionString-response instead.")))

(cl:ensure-generic-function 'current_inputs_outputs-val :lambda-list '(m))
(cl:defmethod current_inputs_outputs-val ((m <SlugsInitExecutionString-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:current_inputs_outputs-val is deprecated.  Use slugs_ros-srv:current_inputs_outputs instead.")
  (current_inputs_outputs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsInitExecutionString-response>) ostream)
  "Serializes a message object of type '<SlugsInitExecutionString-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'current_inputs_outputs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'current_inputs_outputs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsInitExecutionString-response>) istream)
  "Deserializes a message object of type '<SlugsInitExecutionString-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current_inputs_outputs) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'current_inputs_outputs) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsInitExecutionString-response>)))
  "Returns string type for a service object of type '<SlugsInitExecutionString-response>"
  "slugs_ros/SlugsInitExecutionStringResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsInitExecutionString-response)))
  "Returns string type for a service object of type 'SlugsInitExecutionString-response"
  "slugs_ros/SlugsInitExecutionStringResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsInitExecutionString-response>)))
  "Returns md5sum for a message object of type '<SlugsInitExecutionString-response>"
  "78d9b180a6363989c4867d53ceedde9f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsInitExecutionString-response)))
  "Returns md5sum for a message object of type 'SlugsInitExecutionString-response"
  "78d9b180a6363989c4867d53ceedde9f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsInitExecutionString-response>)))
  "Returns full string definition for message of type '<SlugsInitExecutionString-response>"
  (cl:format cl:nil "string current_inputs_outputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsInitExecutionString-response)))
  "Returns full string definition for message of type 'SlugsInitExecutionString-response"
  (cl:format cl:nil "string current_inputs_outputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsInitExecutionString-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'current_inputs_outputs))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsInitExecutionString-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsInitExecutionString-response
    (cl:cons ':current_inputs_outputs (current_inputs_outputs msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SlugsInitExecutionString)))
  'SlugsInitExecutionString-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SlugsInitExecutionString)))
  'SlugsInitExecutionString-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsInitExecutionString)))
  "Returns string type for a service object of type '<SlugsInitExecutionString>"
  "slugs_ros/SlugsInitExecutionString")