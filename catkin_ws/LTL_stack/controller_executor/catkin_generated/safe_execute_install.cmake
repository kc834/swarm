execute_process(COMMAND "/home/kchaudhari/catkin_ws/LTL_stack/controller_executor/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/kchaudhari/catkin_ws/LTL_stack/controller_executor/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
