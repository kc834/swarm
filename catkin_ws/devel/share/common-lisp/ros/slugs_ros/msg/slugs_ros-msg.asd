
(cl:in-package :asdf)

(defsystem "slugs_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "StringArray" :depends-on ("_package_StringArray"))
    (:file "_package_StringArray" :depends-on ("_package"))
    (:file "SlugsSynthesisActionFeedback" :depends-on ("_package_SlugsSynthesisActionFeedback"))
    (:file "_package_SlugsSynthesisActionFeedback" :depends-on ("_package"))
    (:file "SlugsSynthesisGoal" :depends-on ("_package_SlugsSynthesisGoal"))
    (:file "_package_SlugsSynthesisGoal" :depends-on ("_package"))
    (:file "SlugsSynthesisAction" :depends-on ("_package_SlugsSynthesisAction"))
    (:file "_package_SlugsSynthesisAction" :depends-on ("_package"))
    (:file "SlugsSynthesisFeedback" :depends-on ("_package_SlugsSynthesisFeedback"))
    (:file "_package_SlugsSynthesisFeedback" :depends-on ("_package"))
    (:file "SlugsSynthesisActionResult" :depends-on ("_package_SlugsSynthesisActionResult"))
    (:file "_package_SlugsSynthesisActionResult" :depends-on ("_package"))
    (:file "SlugsSynthesisResult" :depends-on ("_package_SlugsSynthesisResult"))
    (:file "_package_SlugsSynthesisResult" :depends-on ("_package"))
    (:file "SlugsSynthesisActionGoal" :depends-on ("_package_SlugsSynthesisActionGoal"))
    (:file "_package_SlugsSynthesisActionGoal" :depends-on ("_package"))
  ))