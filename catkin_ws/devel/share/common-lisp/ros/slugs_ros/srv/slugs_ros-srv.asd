
(cl:in-package :asdf)

(defsystem "slugs_ros-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SlugsGetInputs" :depends-on ("_package_SlugsGetInputs"))
    (:file "_package_SlugsGetInputs" :depends-on ("_package"))
    (:file "SlugsTransExecutionArray" :depends-on ("_package_SlugsTransExecutionArray"))
    (:file "_package_SlugsTransExecutionArray" :depends-on ("_package"))
    (:file "SlugsInitExecutionString" :depends-on ("_package_SlugsInitExecutionString"))
    (:file "_package_SlugsInitExecutionString" :depends-on ("_package"))
    (:file "SlugsTransExecutionString" :depends-on ("_package_SlugsTransExecutionString"))
    (:file "_package_SlugsTransExecutionString" :depends-on ("_package"))
    (:file "SlugsSetGoal" :depends-on ("_package_SlugsSetGoal"))
    (:file "_package_SlugsSetGoal" :depends-on ("_package"))
    (:file "SlugsGetOutputs" :depends-on ("_package_SlugsGetOutputs"))
    (:file "_package_SlugsGetOutputs" :depends-on ("_package"))
    (:file "SlugsInitExecutionArray" :depends-on ("_package_SlugsInitExecutionArray"))
    (:file "_package_SlugsInitExecutionArray" :depends-on ("_package"))
  ))