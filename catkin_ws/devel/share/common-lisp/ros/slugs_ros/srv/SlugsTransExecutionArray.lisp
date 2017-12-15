; Auto-generated. Do not edit!


(cl:in-package slugs_ros-srv)


;//! \htmlinclude SlugsTransExecutionArray-request.msg.html

(cl:defclass <SlugsTransExecutionArray-request> (roslisp-msg-protocol:ros-message)
  ((trans_inputs_key_array
    :reader trans_inputs_key_array
    :initarg :trans_inputs_key_array
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (trans_inputs_value_array
    :reader trans_inputs_value_array
    :initarg :trans_inputs_value_array
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass SlugsTransExecutionArray-request (<SlugsTransExecutionArray-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsTransExecutionArray-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsTransExecutionArray-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsTransExecutionArray-request> is deprecated: use slugs_ros-srv:SlugsTransExecutionArray-request instead.")))

(cl:ensure-generic-function 'trans_inputs_key_array-val :lambda-list '(m))
(cl:defmethod trans_inputs_key_array-val ((m <SlugsTransExecutionArray-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:trans_inputs_key_array-val is deprecated.  Use slugs_ros-srv:trans_inputs_key_array instead.")
  (trans_inputs_key_array m))

(cl:ensure-generic-function 'trans_inputs_value_array-val :lambda-list '(m))
(cl:defmethod trans_inputs_value_array-val ((m <SlugsTransExecutionArray-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:trans_inputs_value_array-val is deprecated.  Use slugs_ros-srv:trans_inputs_value_array instead.")
  (trans_inputs_value_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsTransExecutionArray-request>) ostream)
  "Serializes a message object of type '<SlugsTransExecutionArray-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'trans_inputs_key_array))))
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
   (cl:slot-value msg 'trans_inputs_key_array))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'trans_inputs_value_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'trans_inputs_value_array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsTransExecutionArray-request>) istream)
  "Deserializes a message object of type '<SlugsTransExecutionArray-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'trans_inputs_key_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'trans_inputs_key_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'trans_inputs_value_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'trans_inputs_value_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsTransExecutionArray-request>)))
  "Returns string type for a service object of type '<SlugsTransExecutionArray-request>"
  "slugs_ros/SlugsTransExecutionArrayRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsTransExecutionArray-request)))
  "Returns string type for a service object of type 'SlugsTransExecutionArray-request"
  "slugs_ros/SlugsTransExecutionArrayRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsTransExecutionArray-request>)))
  "Returns md5sum for a message object of type '<SlugsTransExecutionArray-request>"
  "54bce38b27d158ed4216bcf42383f95d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsTransExecutionArray-request)))
  "Returns md5sum for a message object of type 'SlugsTransExecutionArray-request"
  "54bce38b27d158ed4216bcf42383f95d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsTransExecutionArray-request>)))
  "Returns full string definition for message of type '<SlugsTransExecutionArray-request>"
  (cl:format cl:nil "string[] trans_inputs_key_array~%bool[]   trans_inputs_value_array~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsTransExecutionArray-request)))
  "Returns full string definition for message of type 'SlugsTransExecutionArray-request"
  (cl:format cl:nil "string[] trans_inputs_key_array~%bool[]   trans_inputs_value_array~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsTransExecutionArray-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'trans_inputs_key_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'trans_inputs_value_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsTransExecutionArray-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsTransExecutionArray-request
    (cl:cons ':trans_inputs_key_array (trans_inputs_key_array msg))
    (cl:cons ':trans_inputs_value_array (trans_inputs_value_array msg))
))
;//! \htmlinclude SlugsTransExecutionArray-response.msg.html

(cl:defclass <SlugsTransExecutionArray-response> (roslisp-msg-protocol:ros-message)
  ((current_inputs_outputs_key_array
    :reader current_inputs_outputs_key_array
    :initarg :current_inputs_outputs_key_array
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (current_inputs_outputs_value_array
    :reader current_inputs_outputs_value_array
    :initarg :current_inputs_outputs_value_array
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass SlugsTransExecutionArray-response (<SlugsTransExecutionArray-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsTransExecutionArray-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsTransExecutionArray-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsTransExecutionArray-response> is deprecated: use slugs_ros-srv:SlugsTransExecutionArray-response instead.")))

(cl:ensure-generic-function 'current_inputs_outputs_key_array-val :lambda-list '(m))
(cl:defmethod current_inputs_outputs_key_array-val ((m <SlugsTransExecutionArray-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:current_inputs_outputs_key_array-val is deprecated.  Use slugs_ros-srv:current_inputs_outputs_key_array instead.")
  (current_inputs_outputs_key_array m))

(cl:ensure-generic-function 'current_inputs_outputs_value_array-val :lambda-list '(m))
(cl:defmethod current_inputs_outputs_value_array-val ((m <SlugsTransExecutionArray-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:current_inputs_outputs_value_array-val is deprecated.  Use slugs_ros-srv:current_inputs_outputs_value_array instead.")
  (current_inputs_outputs_value_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsTransExecutionArray-response>) ostream)
  "Serializes a message object of type '<SlugsTransExecutionArray-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'current_inputs_outputs_key_array))))
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
   (cl:slot-value msg 'current_inputs_outputs_key_array))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'current_inputs_outputs_value_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'current_inputs_outputs_value_array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsTransExecutionArray-response>) istream)
  "Deserializes a message object of type '<SlugsTransExecutionArray-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'current_inputs_outputs_key_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'current_inputs_outputs_key_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'current_inputs_outputs_value_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'current_inputs_outputs_value_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsTransExecutionArray-response>)))
  "Returns string type for a service object of type '<SlugsTransExecutionArray-response>"
  "slugs_ros/SlugsTransExecutionArrayResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsTransExecutionArray-response)))
  "Returns string type for a service object of type 'SlugsTransExecutionArray-response"
  "slugs_ros/SlugsTransExecutionArrayResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsTransExecutionArray-response>)))
  "Returns md5sum for a message object of type '<SlugsTransExecutionArray-response>"
  "54bce38b27d158ed4216bcf42383f95d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsTransExecutionArray-response)))
  "Returns md5sum for a message object of type 'SlugsTransExecutionArray-response"
  "54bce38b27d158ed4216bcf42383f95d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsTransExecutionArray-response>)))
  "Returns full string definition for message of type '<SlugsTransExecutionArray-response>"
  (cl:format cl:nil "string[] current_inputs_outputs_key_array~%bool[]   current_inputs_outputs_value_array~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsTransExecutionArray-response)))
  "Returns full string definition for message of type 'SlugsTransExecutionArray-response"
  (cl:format cl:nil "string[] current_inputs_outputs_key_array~%bool[]   current_inputs_outputs_value_array~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsTransExecutionArray-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'current_inputs_outputs_key_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'current_inputs_outputs_value_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsTransExecutionArray-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsTransExecutionArray-response
    (cl:cons ':current_inputs_outputs_key_array (current_inputs_outputs_key_array msg))
    (cl:cons ':current_inputs_outputs_value_array (current_inputs_outputs_value_array msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SlugsTransExecutionArray)))
  'SlugsTransExecutionArray-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SlugsTransExecutionArray)))
  'SlugsTransExecutionArray-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsTransExecutionArray)))
  "Returns string type for a service object of type '<SlugsTransExecutionArray>"
  "slugs_ros/SlugsTransExecutionArray")