; Auto-generated. Do not edit!


(cl:in-package slugs_ros-msg)


;//! \htmlinclude SlugsSynthesisResult.msg.html

(cl:defclass <SlugsSynthesisResult> (roslisp-msg-protocol:ros-message)
  ((realizable
    :reader realizable
    :initarg :realizable
    :type cl:boolean
    :initform cl:nil)
   (synthesis_time
    :reader synthesis_time
    :initarg :synthesis_time
    :type cl:float
    :initform 0.0)
   (output_message
    :reader output_message
    :initarg :output_message
    :type cl:string
    :initform ""))
)

(cl:defclass SlugsSynthesisResult (<SlugsSynthesisResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsSynthesisResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsSynthesisResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-msg:<SlugsSynthesisResult> is deprecated: use slugs_ros-msg:SlugsSynthesisResult instead.")))

(cl:ensure-generic-function 'realizable-val :lambda-list '(m))
(cl:defmethod realizable-val ((m <SlugsSynthesisResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-msg:realizable-val is deprecated.  Use slugs_ros-msg:realizable instead.")
  (realizable m))

(cl:ensure-generic-function 'synthesis_time-val :lambda-list '(m))
(cl:defmethod synthesis_time-val ((m <SlugsSynthesisResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-msg:synthesis_time-val is deprecated.  Use slugs_ros-msg:synthesis_time instead.")
  (synthesis_time m))

(cl:ensure-generic-function 'output_message-val :lambda-list '(m))
(cl:defmethod output_message-val ((m <SlugsSynthesisResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-msg:output_message-val is deprecated.  Use slugs_ros-msg:output_message instead.")
  (output_message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsSynthesisResult>) ostream)
  "Serializes a message object of type '<SlugsSynthesisResult>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'realizable) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'synthesis_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'output_message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'output_message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsSynthesisResult>) istream)
  "Deserializes a message object of type '<SlugsSynthesisResult>"
    (cl:setf (cl:slot-value msg 'realizable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'synthesis_time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'output_message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'output_message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsSynthesisResult>)))
  "Returns string type for a message object of type '<SlugsSynthesisResult>"
  "slugs_ros/SlugsSynthesisResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsSynthesisResult)))
  "Returns string type for a message object of type 'SlugsSynthesisResult"
  "slugs_ros/SlugsSynthesisResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsSynthesisResult>)))
  "Returns md5sum for a message object of type '<SlugsSynthesisResult>"
  "34e38da21dad06046624bf2e5222d34a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsSynthesisResult)))
  "Returns md5sum for a message object of type 'SlugsSynthesisResult"
  "34e38da21dad06046624bf2e5222d34a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsSynthesisResult>)))
  "Returns full string definition for message of type '<SlugsSynthesisResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# outputs~%bool realizable~%float64 synthesis_time~%string output_message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsSynthesisResult)))
  "Returns full string definition for message of type 'SlugsSynthesisResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# outputs~%bool realizable~%float64 synthesis_time~%string output_message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsSynthesisResult>))
  (cl:+ 0
     1
     8
     4 (cl:length (cl:slot-value msg 'output_message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsSynthesisResult>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsSynthesisResult
    (cl:cons ':realizable (realizable msg))
    (cl:cons ':synthesis_time (synthesis_time msg))
    (cl:cons ':output_message (output_message msg))
))
