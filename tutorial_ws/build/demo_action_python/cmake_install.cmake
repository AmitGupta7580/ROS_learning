# Install script for directory: /home/ammmy/Desktop/tutorial_ws/src/demo_action_python

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ammmy/Desktop/tutorial_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/demo_action_python/action" TYPE FILE FILES "/home/ammmy/Desktop/tutorial_ws/src/demo_action_python/action/python_action.action")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/demo_action_python/msg" TYPE FILE FILES
    "/home/ammmy/Desktop/tutorial_ws/devel/share/demo_action_python/msg/python_actionAction.msg"
    "/home/ammmy/Desktop/tutorial_ws/devel/share/demo_action_python/msg/python_actionActionGoal.msg"
    "/home/ammmy/Desktop/tutorial_ws/devel/share/demo_action_python/msg/python_actionActionResult.msg"
    "/home/ammmy/Desktop/tutorial_ws/devel/share/demo_action_python/msg/python_actionActionFeedback.msg"
    "/home/ammmy/Desktop/tutorial_ws/devel/share/demo_action_python/msg/python_actionGoal.msg"
    "/home/ammmy/Desktop/tutorial_ws/devel/share/demo_action_python/msg/python_actionResult.msg"
    "/home/ammmy/Desktop/tutorial_ws/devel/share/demo_action_python/msg/python_actionFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/demo_action_python/cmake" TYPE FILE FILES "/home/ammmy/Desktop/tutorial_ws/build/demo_action_python/catkin_generated/installspace/demo_action_python-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ammmy/Desktop/tutorial_ws/devel/include/demo_action_python")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/ammmy/Desktop/tutorial_ws/devel/share/roseus/ros/demo_action_python")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ammmy/Desktop/tutorial_ws/devel/share/common-lisp/ros/demo_action_python")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/ammmy/Desktop/tutorial_ws/devel/share/gennodejs/ros/demo_action_python")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/ammmy/Desktop/tutorial_ws/devel/lib/python2.7/dist-packages/demo_action_python")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/ammmy/Desktop/tutorial_ws/devel/lib/python2.7/dist-packages/demo_action_python")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ammmy/Desktop/tutorial_ws/build/demo_action_python/catkin_generated/installspace/demo_action_python.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/demo_action_python/cmake" TYPE FILE FILES "/home/ammmy/Desktop/tutorial_ws/build/demo_action_python/catkin_generated/installspace/demo_action_python-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/demo_action_python/cmake" TYPE FILE FILES
    "/home/ammmy/Desktop/tutorial_ws/build/demo_action_python/catkin_generated/installspace/demo_action_pythonConfig.cmake"
    "/home/ammmy/Desktop/tutorial_ws/build/demo_action_python/catkin_generated/installspace/demo_action_pythonConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/demo_action_python" TYPE FILE FILES "/home/ammmy/Desktop/tutorial_ws/src/demo_action_python/package.xml")
endif()

