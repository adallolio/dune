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
include CMakeFiles/Power.LUEMB.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Power.LUEMB.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Power.LUEMB.dir/flags.make

CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o: CMakeFiles/Power.LUEMB.dir/flags.make
CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o: src/Power/LUEMB/Task.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Power::LUEMB::Task, PowerLUEMBTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -o CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o -c /home/autonaut/dune_all/dune/src/Power/LUEMB/Task.cpp

CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Power::LUEMB::Task, PowerLUEMBTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -E /home/autonaut/dune_all/dune/src/Power/LUEMB/Task.cpp > CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.i

CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Power::LUEMB::Task, PowerLUEMBTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -S /home/autonaut/dune_all/dune/src/Power/LUEMB/Task.cpp -o CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.s

CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o.requires:

.PHONY : CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o.requires

CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o.provides: CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o.requires
	$(MAKE) -f CMakeFiles/Power.LUEMB.dir/build.make CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o.provides.build
.PHONY : CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o.provides

CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o.provides.build: CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o


# Object files for target Power.LUEMB
Power_LUEMB_OBJECTS = \
"CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o"

# External object files for target Power.LUEMB
Power_LUEMB_EXTERNAL_OBJECTS =

libPower.LUEMB.a: CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o
libPower.LUEMB.a: CMakeFiles/Power.LUEMB.dir/build.make
libPower.LUEMB.a: CMakeFiles/Power.LUEMB.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libPower.LUEMB.a"
	$(CMAKE_COMMAND) -P CMakeFiles/Power.LUEMB.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Power.LUEMB.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Power.LUEMB.dir/build: libPower.LUEMB.a

.PHONY : CMakeFiles/Power.LUEMB.dir/build

CMakeFiles/Power.LUEMB.dir/requires: CMakeFiles/Power.LUEMB.dir/src/Power/LUEMB/Task.cpp.o.requires

.PHONY : CMakeFiles/Power.LUEMB.dir/requires

CMakeFiles/Power.LUEMB.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Power.LUEMB.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Power.LUEMB.dir/clean

CMakeFiles/Power.LUEMB.dir/depend:
	cd /home/autonaut/dune_all/dune && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune/CMakeFiles/Power.LUEMB.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Power.LUEMB.dir/depend

