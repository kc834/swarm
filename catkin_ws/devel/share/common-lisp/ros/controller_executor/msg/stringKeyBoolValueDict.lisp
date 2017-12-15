; Auto-generated. Do not edit!


(cl:in-package controller_executor-msg)


;//! \htmlinclude stringKeyBoolValueDict.msg.html

(cl:defclass <stringKeyBoolValueDict> (roslisp-msg-protocol:ros-message)
  ((keys
    :reader keys
    :initarg :keys
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (values
    :reader values
    :initarg :values
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass stringKeyBoolValueDict (<stringKeyBoolValueDict>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stringKeyBoolValueDict>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stringKeyBoolValueDict)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name controller_executor-msg:<stringKeyBoolValueDict> is deprecated: use controller_executor-msg:stringKeyBoolValueDict instead.")))

(cl:ensure-generic-function 'keys-val :lambda-list '(m))
(cl:defmethod keys-val ((m <stringKeyBoolValueDict>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller_executor-msg:keys-val is deprecated.  Use controller_executor-msg:keys instead.")
  (keys m))

(cl:ensure-generic-function 'values-val :lambda-list '(m))
(cl:defmethod values-val ((m <stringKeyBoolValueDict>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller_executor-msg:values-val is deprecated.  Use controller_executor-msg:values instead.")
  (values m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stringKeyBoolValueDict>) ostream)
  "Serializes a message object of type '<stringKeyBoolValueDict>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'keys))))
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
   (cl:slot-value msg 'keys))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'values))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'values))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stringKeyBoolValueDict>) istream)
  "Deserializes a message object of type '<stringKeyBoolValueDict>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'keys) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'keys)))
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
  (cl:setf (cl:slot-value msg 'values) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'values)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stringKeyBoolValueDict>)))
  "Returns string type for a message object of type '<stringKeyBoolValueDict>"
  "controller_executor/stringKeyBoolValueDict")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stringKeyBoolValueDict)))
  "Returns string type for a message object of type 'stringKeyBoolValueDict"
  "controller_executor/stringKeyBoolValueDict")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stringKeyBoolValueDict>)))
  "Returns md5sum for a message object of type '<stringKeyBoolValueDict>"
  "c60aeeeca22f58984ac5f13e4b5831c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stringKeyBoolValueDict)))
  "Returns md5sum for a message object of type 'stringKeyBoolValueDict"
  "c60aeeeca22f58984ac5f13e4b5831c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stringKeyBoolValueDict>)))
  "Returns full string definition for message of type '<stringKeyBoolValueDict>"
  (cl:format cl:nil "string[] keys~%bool[] values~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stringKeyBoolValueDict)))
  "Returns full string definition for message of type 'stringKeyBoolValueDict"
  (cl:format cl:nil "string[] keys~%bool[] values~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stringKeyBoolValueDict>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'keys) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'values) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stringKeyBoolValueDict>))
  "Converts a ROS message object to a list"
  (cl:list 'stringKeyBoolValueDict
    (cl:cons ':keys (keys msg))
    (cl:cons ':values (values msg))
))
