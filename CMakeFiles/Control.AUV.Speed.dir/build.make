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
CMAKE_SOURCE_DIR = /home/autonaut/dune_all/dune

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/autonaut/dune_all/dune

# Include any dependencies generated for this target.
include CMakeFiles/Control.AUV.Speed.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Control.AUV.Speed.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Control.AUV.Speed.dir/flags.make

CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o: CMakeFiles/Control.AUV.Speed.dir/flags.make
CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o: src/Control/AUV/Speed/Task.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Control::AUV::Speed::Task, ControlAUVSpeedTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -o CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o -c /home/autonaut/dune_all/dune/src/Control/AUV/Speed/Task.cpp

CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Control::AUV::Speed::Task, ControlAUVSpeedTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -E /home/autonaut/dune_all/dune/src/Control/AUV/Speed/Task.cpp > CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.i

CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Control::AUV::Speed::Task, ControlAUVSpeedTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -S /home/autonaut/dune_all/dune/src/Control/AUV/Speed/Task.cpp -o CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.s

CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o.requires:

.PHONY : CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o.requires

CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o.provides: CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o.requires
	$(MAKE) -f CMakeFiles/Control.AUV.Speed.dir/build.make CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o.provides.build
.PHONY : CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o.provides

CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o.provides.build: CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o


# Object files for target Control.AUV.Speed
Control_AUV_Speed_OBJECTS = \
"CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o"

# External object files for target Control.AUV.Speed
Control_AUV_Speed_EXTERNAL_OBJECTS =

libControl.AUV.Speed.a: CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o
libControl.AUV.Speed.a: CMakeFiles/Control.AUV.Speed.dir/build.make
libControl.AUV.Speed.a: CMakeFiles/Control.AUV.Speed.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libControl.AUV.Speed.a"
	$(CMAKE_COMMAND) -P CMakeFiles/Control.AUV.Speed.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Control.AUV.Speed.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Control.AUV.Speed.dir/build: libControl.AUV.Speed.a

.PHONY : CMakeFiles/Control.AUV.Speed.dir/build

CMakeFiles/Control.AUV.Speed.dir/requires: CMakeFiles/Control.AUV.Speed.dir/src/Control/AUV/Speed/Task.cpp.o.requires

.PHONY : CMakeFiles/Control.AUV.Speed.dir/requires

CMakeFiles/Control.AUV.Speed.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Control.AUV.Speed.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Control.AUV.Speed.dir/clean

CMakeFiles/Control.AUV.Speed.dir/depend:
	cd /home/autonaut/dune_all/dune && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune/CMakeFiles/Control.AUV.Speed.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Control.AUV.Speed.dir/depend

