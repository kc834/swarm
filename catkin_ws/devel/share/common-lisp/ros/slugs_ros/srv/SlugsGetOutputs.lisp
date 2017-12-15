; Auto-generated. Do not edit!


(cl:in-package slugs_ros-srv)


;//! \htmlinclude SlugsGetOutputs-request.msg.html

(cl:defclass <SlugsGetOutputs-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SlugsGetOutputs-request (<SlugsGetOutputs-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsGetOutputs-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsGetOutputs-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsGetOutputs-request> is deprecated: use slugs_ros-srv:SlugsGetOutputs-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsGetOutputs-request>) ostream)
  "Serializes a message object of type '<SlugsGetOutputs-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsGetOutputs-request>) istream)
  "Deserializes a message object of type '<SlugsGetOutputs-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsGetOutputs-request>)))
  "Returns string type for a service object of type '<SlugsGetOutputs-request>"
  "slugs_ros/SlugsGetOutputsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsGetOutputs-request)))
  "Returns string type for a service object of type 'SlugsGetOutputs-request"
  "slugs_ros/SlugsGetOutputsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsGetOutputs-request>)))
  "Returns md5sum for a message object of type '<SlugsGetOutputs-request>"
  "189a6272b7e6e367f3a14768143f8a56")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsGetOutputs-request)))
  "Returns md5sum for a message object of type 'SlugsGetOutputs-request"
  "189a6272b7e6e367f3a14768143f8a56")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsGetOutputs-request>)))
  "Returns full string definition for message of type '<SlugsGetOutputs-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsGetOutputs-request)))
  "Returns full string definition for message of type 'SlugsGetOutputs-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsGetOutputs-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsGetOutputs-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsGetOutputs-request
))
;//! \htmlinclude SlugsGetOutputs-response.msg.html

(cl:defclass <SlugsGetOutputs-response> (roslisp-msg-protocol:ros-message)
  ((outputs_array
    :reader outputs_array
    :initarg :outputs_array
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass SlugsGetOutputs-response (<SlugsGetOutputs-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsGetOutputs-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsGetOutputs-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsGetOutputs-response> is deprecated: use slugs_ros-srv:SlugsGetOutputs-response instead.")))

(cl:ensure-generic-function 'outputs_array-val :lambda-list '(m))
(cl:defmethod outputs_array-val ((m <SlugsGetOutputs-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:outputs_array-val is deprecated.  Use slugs_ros-srv:outputs_array instead.")
  (outputs_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsGetOutputs-response>) ostream)
  "Serializes a message object of type '<SlugsGetOutputs-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'outputs_array))))
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
   (cl:slot-value msg 'outputs_array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsGetOutputs-response>) istream)
  "Deserializes a message object of type '<SlugsGetOutputs-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'outputs_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'outputs_array)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsGetOutputs-response>)))
  "Returns string type for a service object of type '<SlugsGetOutputs-response>"
  "slugs_ros/SlugsGetOutputsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsGetOutputs-response)))
  "Returns string type for a service object of type 'SlugsGetOutputs-response"
  "slugs_ros/SlugsGetOutputsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsGetOutputs-response>)))
  "Returns md5sum for a message object of type '<SlugsGetOutputs-response>"
  "189a6272b7e6e367f3a14768143f8a56")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsGetOutputs-response)))
  "Returns md5sum for a message object of type 'SlugsGetOutputs-response"
  "189a6272b7e6e367f3a14768143f8a56")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsGetOutputs-response>)))
  "Returns full string definition for message of type '<SlugsGetOutputs-response>"
  (cl:format cl:nil "string[] outputs_array~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsGetOutputs-response)))
  "Returns full string definition for message of type 'SlugsGetOutputs-response"
  (cl:format cl:nil "string[] outputs_array~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsGetOutputs-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'outputs_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsGetOutputs-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsGetOutputs-response
    (cl:cons ':outputs_array (outputs_array msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SlugsGetOutputs)))
  'SlugsGetOutputs-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SlugsGetOutputs)))
  'SlugsGetOutputs-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsGetOutputs)))
  "Returns string type for a service object of type '<SlugsGetOutputs>"
  "slugs_ros/SlugsGetOutputs")