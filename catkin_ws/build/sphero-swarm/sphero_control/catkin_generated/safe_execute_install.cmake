execute_process(COMMAND "/home/kchaudhari/catkin_ws/build/sphero-swarm/sphero_control/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/kchaudhari/catkin_ws/build/sphero-swarm/sphero_control/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
