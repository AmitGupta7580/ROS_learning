# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ammmy/Desktop/tutorial_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ammmy/Desktop/tutorial_ws/build

# Include any dependencies generated for this target.
include demo_service_cpp/CMakeFiles/server.dir/depend.make

# Include the progress variables for this target.
include demo_service_cpp/CMakeFiles/server.dir/progress.make

# Include the compile flags for this target's objects.
include demo_service_cpp/CMakeFiles/server.dir/flags.make

demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o: demo_service_cpp/CMakeFiles/server.dir/flags.make
demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o: /home/ammmy/Desktop/tutorial_ws/src/demo_service_cpp/src/server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ammmy/Desktop/tutorial_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o"
	cd /home/ammmy/Desktop/tutorial_ws/build/demo_service_cpp && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/server.dir/src/server.cpp.o -c /home/ammmy/Desktop/tutorial_ws/src/demo_service_cpp/src/server.cpp

demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/src/server.cpp.i"
	cd /home/ammmy/Desktop/tutorial_ws/build/demo_service_cpp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ammmy/Desktop/tutorial_ws/src/demo_service_cpp/src/server.cpp > CMakeFiles/server.dir/src/server.cpp.i

demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/src/server.cpp.s"
	cd /home/ammmy/Desktop/tutorial_ws/build/demo_service_cpp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ammmy/Desktop/tutorial_ws/src/demo_service_cpp/src/server.cpp -o CMakeFiles/server.dir/src/server.cpp.s

demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o.requires:

.PHONY : demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o.requires

demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o.provides: demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o.requires
	$(MAKE) -f demo_service_cpp/CMakeFiles/server.dir/build.make demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o.provides.build
.PHONY : demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o.provides

demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o.provides.build: demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o


# Object files for target server
server_OBJECTS = \
"CMakeFiles/server.dir/src/server.cpp.o"

# External object files for target server
server_EXTERNAL_OBJECTS =

/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: demo_service_cpp/CMakeFiles/server.dir/build.make
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /opt/ros/kinetic/lib/libroscpp.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /opt/ros/kinetic/lib/librosconsole.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /opt/ros/kinetic/lib/librostime.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /opt/ros/kinetic/lib/libcpp_common.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server: demo_service_cpp/CMakeFiles/server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ammmy/Desktop/tutorial_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server"
	cd /home/ammmy/Desktop/tutorial_ws/build/demo_service_cpp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
demo_service_cpp/CMakeFiles/server.dir/build: /home/ammmy/Desktop/tutorial_ws/devel/lib/demo_service_cpp/server

.PHONY : demo_service_cpp/CMakeFiles/server.dir/build

demo_service_cpp/CMakeFiles/server.dir/requires: demo_service_cpp/CMakeFiles/server.dir/src/server.cpp.o.requires

.PHONY : demo_service_cpp/CMakeFiles/server.dir/requires

demo_service_cpp/CMakeFiles/server.dir/clean:
	cd /home/ammmy/Desktop/tutorial_ws/build/demo_service_cpp && $(CMAKE_COMMAND) -P CMakeFiles/server.dir/cmake_clean.cmake
.PHONY : demo_service_cpp/CMakeFiles/server.dir/clean

demo_service_cpp/CMakeFiles/server.dir/depend:
	cd /home/ammmy/Desktop/tutorial_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ammmy/Desktop/tutorial_ws/src /home/ammmy/Desktop/tutorial_ws/src/demo_service_cpp /home/ammmy/Desktop/tutorial_ws/build /home/ammmy/Desktop/tutorial_ws/build/demo_service_cpp /home/ammmy/Desktop/tutorial_ws/build/demo_service_cpp/CMakeFiles/server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : demo_service_cpp/CMakeFiles/server.dir/depend

