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
include CMakeFiles/dune-lucb.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/dune-lucb.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/dune-lucb.dir/flags.make

CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o: CMakeFiles/dune-lucb.dir/flags.make
CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o: programs/utils/dune-lucb.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o -c /home/autonaut/dune_all/dune/programs/utils/dune-lucb.cpp

CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/autonaut/dune_all/dune/programs/utils/dune-lucb.cpp > CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.i

CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/autonaut/dune_all/dune/programs/utils/dune-lucb.cpp -o CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.s

CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o.requires:

.PHONY : CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o.requires

CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o.provides: CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o.requires
	$(MAKE) -f CMakeFiles/dune-lucb.dir/build.make CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o.provides.build
.PHONY : CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o.provides

CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o.provides.build: CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o


# Object files for target dune-lucb
dune__lucb_OBJECTS = \
"CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o"

# External object files for target dune-lucb
dune__lucb_EXTERNAL_OBJECTS =

dune-lucb: CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o
dune-lucb: CMakeFiles/dune-lucb.dir/build.make
dune-lucb: libdune-core.a
dune-lucb: CMakeFiles/dune-lucb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable dune-lucb"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dune-lucb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/dune-lucb.dir/build: dune-lucb

.PHONY : CMakeFiles/dune-lucb.dir/build

CMakeFiles/dune-lucb.dir/requires: CMakeFiles/dune-lucb.dir/programs/utils/dune-lucb.cpp.o.requires

.PHONY : CMakeFiles/dune-lucb.dir/requires

CMakeFiles/dune-lucb.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dune-lucb.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dune-lucb.dir/clean

CMakeFiles/dune-lucb.dir/depend:
	cd /home/autonaut/dune_all/dune && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune/CMakeFiles/dune-lucb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dune-lucb.dir/depend

