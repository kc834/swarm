; Auto-generated. Do not edit!


(cl:in-package slugs_ros-srv)


;//! \htmlinclude SlugsInitExecutionArray-request.msg.html

(cl:defclass <SlugsInitExecutionArray-request> (roslisp-msg-protocol:ros-message)
  ((init_inputs_outputs_key_array
    :reader init_inputs_outputs_key_array
    :initarg :init_inputs_outputs_key_array
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (init_inputs_outputs_value_array
    :reader init_inputs_outputs_value_array
    :initarg :init_inputs_outputs_value_array
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass SlugsInitExecutionArray-request (<SlugsInitExecutionArray-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsInitExecutionArray-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsInitExecutionArray-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsInitExecutionArray-request> is deprecated: use slugs_ros-srv:SlugsInitExecutionArray-request instead.")))

(cl:ensure-generic-function 'init_inputs_outputs_key_array-val :lambda-list '(m))
(cl:defmethod init_inputs_outputs_key_array-val ((m <SlugsInitExecutionArray-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:init_inputs_outputs_key_array-val is deprecated.  Use slugs_ros-srv:init_inputs_outputs_key_array instead.")
  (init_inputs_outputs_key_array m))

(cl:ensure-generic-function 'init_inputs_outputs_value_array-val :lambda-list '(m))
(cl:defmethod init_inputs_outputs_value_array-val ((m <SlugsInitExecutionArray-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:init_inputs_outputs_value_array-val is deprecated.  Use slugs_ros-srv:init_inputs_outputs_value_array instead.")
  (init_inputs_outputs_value_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsInitExecutionArray-request>) ostream)
  "Serializes a message object of type '<SlugsInitExecutionArray-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'init_inputs_outputs_key_array))))
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
   (cl:slot-value msg 'init_inputs_outputs_key_array))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'init_inputs_outputs_value_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'init_inputs_outputs_value_array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsInitExecutionArray-request>) istream)
  "Deserializes a message object of type '<SlugsInitExecutionArray-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'init_inputs_outputs_key_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'init_inputs_outputs_key_array)))
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
  (cl:setf (cl:slot-value msg 'init_inputs_outputs_value_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'init_inputs_outputs_value_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsInitExecutionArray-request>)))
  "Returns string type for a service object of type '<SlugsInitExecutionArray-request>"
  "slugs_ros/SlugsInitExecutionArrayRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsInitExecutionArray-request)))
  "Returns string type for a service object of type 'SlugsInitExecutionArray-request"
  "slugs_ros/SlugsInitExecutionArrayRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsInitExecutionArray-request>)))
  "Returns md5sum for a message object of type '<SlugsInitExecutionArray-request>"
  "25d40750652088a9108edad12a666cca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsInitExecutionArray-request)))
  "Returns md5sum for a message object of type 'SlugsInitExecutionArray-request"
  "25d40750652088a9108edad12a666cca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsInitExecutionArray-request>)))
  "Returns full string definition for message of type '<SlugsInitExecutionArray-request>"
  (cl:format cl:nil "string[] init_inputs_outputs_key_array~%bool[]   init_inputs_outputs_value_array~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsInitExecutionArray-request)))
  "Returns full string definition for message of type 'SlugsInitExecutionArray-request"
  (cl:format cl:nil "string[] init_inputs_outputs_key_array~%bool[]   init_inputs_outputs_value_array~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsInitExecutionArray-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'init_inputs_outputs_key_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'init_inputs_outputs_value_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsInitExecutionArray-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsInitExecutionArray-request
    (cl:cons ':init_inputs_outputs_key_array (init_inputs_outputs_key_array msg))
    (cl:cons ':init_inputs_outputs_value_array (init_inputs_outputs_value_array msg))
))
;//! \htmlinclude SlugsInitExecutionArray-response.msg.html

(cl:defclass <SlugsInitExecutionArray-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SlugsInitExecutionArray-response (<SlugsInitExecutionArray-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsInitExecutionArray-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsInitExecutionArray-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-srv:<SlugsInitExecutionArray-response> is deprecated: use slugs_ros-srv:SlugsInitExecutionArray-response instead.")))

(cl:ensure-generic-function 'current_inputs_outputs_key_array-val :lambda-list '(m))
(cl:defmethod current_inputs_outputs_key_array-val ((m <SlugsInitExecutionArray-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:current_inputs_outputs_key_array-val is deprecated.  Use slugs_ros-srv:current_inputs_outputs_key_array instead.")
  (current_inputs_outputs_key_array m))

(cl:ensure-generic-function 'current_inputs_outputs_value_array-val :lambda-list '(m))
(cl:defmethod current_inputs_outputs_value_array-val ((m <SlugsInitExecutionArray-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-srv:current_inputs_outputs_value_array-val is deprecated.  Use slugs_ros-srv:current_inputs_outputs_value_array instead.")
  (current_inputs_outputs_value_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsInitExecutionArray-response>) ostream)
  "Serializes a message object of type '<SlugsInitExecutionArray-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsInitExecutionArray-response>) istream)
  "Deserializes a message object of type '<SlugsInitExecutionArray-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsInitExecutionArray-response>)))
  "Returns string type for a service object of type '<SlugsInitExecutionArray-response>"
  "slugs_ros/SlugsInitExecutionArrayResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsInitExecutionArray-response)))
  "Returns string type for a service object of type 'SlugsInitExecutionArray-response"
  "slugs_ros/SlugsInitExecutionArrayResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsInitExecutionArray-response>)))
  "Returns md5sum for a message object of type '<SlugsInitExecutionArray-response>"
  "25d40750652088a9108edad12a666cca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsInitExecutionArray-response)))
  "Returns md5sum for a message object of type 'SlugsInitExecutionArray-response"
  "25d40750652088a9108edad12a666cca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsInitExecutionArray-response>)))
  "Returns full string definition for message of type '<SlugsInitExecutionArray-response>"
  (cl:format cl:nil "string[] current_inputs_outputs_key_array~%bool[]   current_inputs_outputs_value_array~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsInitExecutionArray-response)))
  "Returns full string definition for message of type 'SlugsInitExecutionArray-response"
  (cl:format cl:nil "string[] current_inputs_outputs_key_array~%bool[]   current_inputs_outputs_value_array~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsInitExecutionArray-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'current_inputs_outputs_key_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'current_inputs_outputs_value_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsInitExecutionArray-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsInitExecutionArray-response
    (cl:cons ':current_inputs_outputs_key_array (current_inputs_outputs_key_array msg))
    (cl:cons ':current_inputs_outputs_value_array (current_inputs_outputs_value_array msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SlugsInitExecutionArray)))
  'SlugsInitExecutionArray-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SlugsInitExecutionArray)))
  'SlugsInitExecutionArray-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsInitExecutionArray)))
  "Returns string type for a service object of type '<SlugsInitExecutionArray>"
  "slugs_ros/SlugsInitExecutionArray")