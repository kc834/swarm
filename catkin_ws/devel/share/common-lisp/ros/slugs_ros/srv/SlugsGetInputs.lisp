; Auto-generated. Do not edit!


(cl:in-package slugs_ros-srv)


;//! \htmlinclude SlugsGetInputs-request.msg.html

(cl:defclass <SlugsGetInputs-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SlugsGetInputs-request (<SlugsGetInputs-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsGetInputs-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsGetInputs-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsGetInputs-request> is deprecated: use slugs_ros-srv:SlugsGetInputs-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsGetInputs-request>) ostream)
  "Serializes a message object of type '<SlugsGetInputs-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsGetInputs-request>) istream)
  "Deserializes a message object of type '<SlugsGetInputs-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsGetInputs-request>)))
  "Returns string type for a service object of type '<SlugsGetInputs-request>"
  "slugs_ros/SlugsGetInputsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsGetInputs-request)))
  "Returns string type for a service object of type 'SlugsGetInputs-request"
  "slugs_ros/SlugsGetInputsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsGetInputs-request>)))
  "Returns md5sum for a message object of type '<SlugsGetInputs-request>"
  "9a51f646ec2ead8a886f766b3088eba7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsGetInputs-request)))
  "Returns md5sum for a message object of type 'SlugsGetInputs-request"
  "9a51f646ec2ead8a886f766b3088eba7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsGetInputs-request>)))
  "Returns full string definition for message of type '<SlugsGetInputs-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsGetInputs-request)))
  "Returns full string definition for message of type 'SlugsGetInputs-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsGetInputs-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsGetInputs-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsGetInputs-request
))
;//! \htmlinclude SlugsGetInputs-response.msg.html

(cl:defclass <SlugsGetInputs-response> (roslisp-msg-protocol:ros-message)
  ((inputs_array
    :reader inputs_array
    :initarg :inputs_array
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass SlugsGetInputs-response (<SlugsGetInputs-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsGetInputs-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsGetInputs-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsGetInputs-response> is deprecated: use slugs_ros-srv:SlugsGetInputs-response instead.")))

(cl:ensure-generic-function 'inputs_array-val :lambda-list '(m))
(cl:defmethod inputs_array-val ((m <SlugsGetInputs-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:inputs_array-val is deprecated.  Use slugs_ros-srv:inputs_array instead.")
  (inputs_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsGetInputs-response>) ostream)
  "Serializes a message object of type '<SlugsGetInputs-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'inputs_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'inputs_array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsGetInputs-response>) istream)
  "Deserializes a message object of type '<SlugsGetInputs-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'inputs_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'inputs_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsGetInputs-response>)))
  "Returns string type for a service object of type '<SlugsGetInputs-response>"
  "slugs_ros/SlugsGetInputsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsGetInputs-response)))
  "Returns string type for a service object of type 'SlugsGetInputs-response"
  "slugs_ros/SlugsGetInputsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsGetInputs-response>)))
  "Returns md5sum for a message object of type '<SlugsGetInputs-response>"
  "9a51f646ec2ead8a886f766b3088eba7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsGetInputs-response)))
  "Returns md5sum for a message object of type 'SlugsGetInputs-response"
  "9a51f646ec2ead8a886f766b3088eba7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsGetInputs-response>)))
  "Returns full string definition for message of type '<SlugsGetInputs-response>"
  (cl:format cl:nil "string[] inputs_array~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsGetInputs-response)))
  "Returns full string definition for message of type 'SlugsGetInputs-response"
  (cl:format cl:nil "string[] inputs_array~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsGetInputs-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'inputs_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsGetInputs-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsGetInputs-response
    (cl:cons ':inputs_array (inputs_array msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SlugsGetInputs)))
  'SlugsGetInputs-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SlugsGetInputs)))
  'SlugsGetInputs-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsGetInputs)))
  "Returns string type for a service object of type '<SlugsGetInputs>"
  "slugs_ros/SlugsGetInputs")