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
include CMakeFiles/dune-activate.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/dune-activate.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/dune-activate.dir/flags.make

CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o: CMakeFiles/dune-activate.dir/flags.make
CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o: programs/utils/dune-activate.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o -c /home/autonaut/dune_all/dune/programs/utils/dune-activate.cpp

CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/autonaut/dune_all/dune/programs/utils/dune-activate.cpp > CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.i

CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/autonaut/dune_all/dune/programs/utils/dune-activate.cpp -o CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.s

CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o.requires:

.PHONY : CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o.requires

CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o.provides: CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o.requires
	$(MAKE) -f CMakeFiles/dune-activate.dir/build.make CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o.provides.build
.PHONY : CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o.provides

CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o.provides.build: CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o


# Object files for target dune-activate
dune__activate_OBJECTS = \
"CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o"

# External object files for target dune-activate
dune__activate_EXTERNAL_OBJECTS =

dune-activate: CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o
dune-activate: CMakeFiles/dune-activate.dir/build.make
dune-activate: libdune-core.a
dune-activate: CMakeFiles/dune-activate.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable dune-activate"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dune-activate.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/dune-activate.dir/build: dune-activate

.PHONY : CMakeFiles/dune-activate.dir/build

CMakeFiles/dune-activate.dir/requires: CMakeFiles/dune-activate.dir/programs/utils/dune-activate.cpp.o.requires

.PHONY : CMakeFiles/dune-activate.dir/requires

CMakeFiles/dune-activate.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dune-activate.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dune-activate.dir/clean

CMakeFiles/dune-activate.dir/depend:
	cd /home/autonaut/dune_all/dune && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune/CMakeFiles/dune-activate.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dune-activate.dir/depend

