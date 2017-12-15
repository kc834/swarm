; Auto-generated. Do not edit!


(cl:in-package slugs_ros-srv)


;//! \htmlinclude SlugsTransExecutionString-request.msg.html

(cl:defclass <SlugsTransExecutionString-request> (roslisp-msg-protocol:ros-message)
  ((trans_inputs
    :reader trans_inputs
    :initarg :trans_inputs
    :type cl:string
    :initform ""))
)

(cl:defclass SlugsTransExecutionString-request (<SlugsTransExecutionString-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsTransExecutionString-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsTransExecutionString-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsTransExecutionString-request> is deprecated: use slugs_ros-srv:SlugsTransExecutionString-request instead.")))

(cl:ensure-generic-function 'trans_inputs-val :lambda-list '(m))
(cl:defmethod trans_inputs-val ((m <SlugsTransExecutionString-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:trans_inputs-val is deprecated.  Use slugs_ros-srv:trans_inputs instead.")
  (trans_inputs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsTransExecutionString-request>) ostream)
  "Serializes a message object of type '<SlugsTransExecutionString-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'trans_inputs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'trans_inputs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsTransExecutionString-request>) istream)
  "Deserializes a message object of type '<SlugsTransExecutionString-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'trans_inputs) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'trans_inputs) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsTransExecutionString-request>)))
  "Returns string type for a service object of type '<SlugsTransExecutionString-request>"
  "slugs_ros/SlugsTransExecutionStringRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsTransExecutionString-request)))
  "Returns string type for a service object of type 'SlugsTransExecutionString-request"
  "slugs_ros/SlugsTransExecutionStringRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsTransExecutionString-request>)))
  "Returns md5sum for a message object of type '<SlugsTransExecutionString-request>"
  "69c14fb59d97d9ff7647614172582a40")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsTransExecutionString-request)))
  "Returns md5sum for a message object of type 'SlugsTransExecutionString-request"
  "69c14fb59d97d9ff7647614172582a40")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsTransExecutionString-request>)))
  "Returns full string definition for message of type '<SlugsTransExecutionString-request>"
  (cl:format cl:nil "string trans_inputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsTransExecutionString-request)))
  "Returns full string definition for message of type 'SlugsTransExecutionString-request"
  (cl:format cl:nil "string trans_inputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsTransExecutionString-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'trans_inputs))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsTransExecutionString-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsTransExecutionString-request
    (cl:cons ':trans_inputs (trans_inputs msg))
))
;//! \htmlinclude SlugsTransExecutionString-response.msg.html

(cl:defclass <SlugsTransExecutionString-response> (roslisp-msg-protocol:ros-message)
  ((current_inputs_outputs
    :reader current_inputs_outputs
    :initarg :current_inputs_outputs
    :type cl:string
    :initform ""))
)

(cl:defclass SlugsTransExecutionString-response (<SlugsTransExecutionString-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsTransExecutionString-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsTransExecutionString-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsTransExecutionString-response> is deprecated: use slugs_ros-srv:SlugsTransExecutionString-response instead.")))

(cl:ensure-generic-function 'current_inputs_outputs-val :lambda-list '(m))
(cl:defmethod current_inputs_outputs-val ((m <SlugsTransExecutionString-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:current_inputs_outputs-val is deprecated.  Use slugs_ros-srv:current_inputs_outputs instead.")
  (current_inputs_outputs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsTransExecutionString-response>) ostream)
  "Serializes a message object of type '<SlugsTransExecutionString-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'current_inputs_outputs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'current_inputs_outputs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsTransExecutionString-response>) istream)
  "Deserializes a message object of type '<SlugsTransExecutionString-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsTransExecutionString-response>)))
  "Returns string type for a service object of type '<SlugsTransExecutionString-response>"
  "slugs_ros/SlugsTransExecutionStringResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsTransExecutionString-response)))
  "Returns string type for a service object of type 'SlugsTransExecutionString-response"
  "slugs_ros/SlugsTransExecutionStringResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsTransExecutionString-response>)))
  "Returns md5sum for a message object of type '<SlugsTransExecutionString-response>"
  "69c14fb59d97d9ff7647614172582a40")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsTransExecutionString-response)))
  "Returns md5sum for a message object of type 'SlugsTransExecutionString-response"
  "69c14fb59d97d9ff7647614172582a40")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsTransExecutionString-response>)))
  "Returns full string definition for message of type '<SlugsTransExecutionString-response>"
  (cl:format cl:nil "string current_inputs_outputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsTransExecutionString-response)))
  "Returns full string definition for message of type 'SlugsTransExecutionString-response"
  (cl:format cl:nil "string current_inputs_outputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsTransExecutionString-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'current_inputs_outputs))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsTransExecutionString-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsTransExecutionString-response
    (cl:cons ':current_inputs_outputs (current_inputs_outputs msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SlugsTransExecutionString)))
  'SlugsTransExecutionString-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SlugsTransExecutionString)))
  'SlugsTransExecutionString-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsTransExecutionString)))
  "Returns string type for a service object of type '<SlugsTransExecutionString>"
  "slugs_ros/SlugsTransExecutionString")