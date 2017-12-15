; Auto-generated. Do not edit!


(cl:in-package slugs_ros-msg)


;//! \htmlinclude SlugsSynthesisGoal.msg.html

(cl:defclass <SlugsSynthesisGoal> (roslisp-msg-protocol:ros-message)
  ((ltl_filename
    :reader ltl_filename
    :initarg :ltl_filename
    :type cl:string
    :initform "")
   (options
    :reader options
    :initarg :options
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (output_filename
    :reader output_filename
    :initarg :output_filename
    :type cl:string
    :initform ""))
)

(cl:defclass SlugsSynthesisGoal (<SlugsSynthesisGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SlugsSynthesisGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SlugsSynthesisGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name slugs_ros-msg:<SlugsSynthesisGoal> is deprecated: use slugs_ros-msg:SlugsSynthesisGoal instead.")))

(cl:ensure-generic-function 'ltl_filename-val :lambda-list '(m))
(cl:defmethod ltl_filename-val ((m <SlugsSynthesisGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-msg:ltl_filename-val is deprecated.  Use slugs_ros-msg:ltl_filename instead.")
  (ltl_filename m))

(cl:ensure-generic-function 'options-val :lambda-list '(m))
(cl:defmethod options-val ((m <SlugsSynthesisGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-msg:options-val is deprecated.  Use slugs_ros-msg:options instead.")
  (options m))

(cl:ensure-generic-function 'output_filename-val :lambda-list '(m))
(cl:defmethod output_filename-val ((m <SlugsSynthesisGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader slugs_ros-msg:output_filename-val is deprecated.  Use slugs_ros-msg:output_filename instead.")
  (output_filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SlugsSynthesisGoal>) ostream)
  "Serializes a message object of type '<SlugsSynthesisGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ltl_filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ltl_filename))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'options))))
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
   (cl:slot-value msg 'options))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'output_filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'output_filename))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SlugsSynthesisGoal>) istream)
  "Deserializes a message object of type '<SlugsSynthesisGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ltl_filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ltl_filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'options) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'options)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'output_filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'output_filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SlugsSynthesisGoal>)))
  "Returns string type for a message object of type '<SlugsSynthesisGoal>"
  "slugs_ros/SlugsSynthesisGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SlugsSynthesisGoal)))
  "Returns string type for a message object of type 'SlugsSynthesisGoal"
  "slugs_ros/SlugsSynthesisGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SlugsSynthesisGoal>)))
  "Returns md5sum for a message object of type '<SlugsSynthesisGoal>"
  "8d645ed2f1784ce7a0776c3763bd99cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SlugsSynthesisGoal)))
  "Returns md5sum for a message object of type 'SlugsSynthesisGoal"
  "8d645ed2f1784ce7a0776c3763bd99cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SlugsSynthesisGoal>)))
  "Returns full string definition for message of type '<SlugsSynthesisGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# inputs~%string ltl_filename  #.slugsin or .structuredSlugs~%string[] options~%string output_filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SlugsSynthesisGoal)))
  "Returns full string definition for message of type 'SlugsSynthesisGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# inputs~%string ltl_filename  #.slugsin or .structuredSlugs~%string[] options~%string output_filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SlugsSynthesisGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'ltl_filename))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'options) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:length (cl:slot-value msg 'output_filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SlugsSynthesisGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'SlugsSynthesisGoal
    (cl:cons ':ltl_filename (ltl_filename msg))
    (cl:cons ':options (options msg))
    (cl:cons ':output_filename (output_filename msg))
))
