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

# Utility rule file for dune-version.

# Include the progress variables for this target.
include CMakeFiles/dune-version.dir/progress.make

CMakeFiles/dune-version:
	/usr/bin/cmake -DPROJECT_SOURCE_DIR=/home/autonaut/dune_all/dune -DDUNE_VERSION_TPL=src/DUNE/Version.cpp.in -DDUNE_VERSION_OUT=/home/autonaut/dune_all/dune/DUNEGeneratedFiles/src/DUNE/Version.cpp -P cmake/Version.cmake

dune-version: CMakeFiles/dune-version
dune-version: CMakeFiles/dune-version.dir/build.make

.PHONY : dune-version

# Rule to build all files generated by this target.
CMakeFiles/dune-version.dir/build: dune-version

.PHONY : CMakeFiles/dune-version.dir/build

CMakeFiles/dune-version.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dune-version.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dune-version.dir/clean

CMakeFiles/dune-version.dir/depend:
	cd /home/autonaut/dune_all/dune && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune/CMakeFiles/dune-version.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dune-version.dir/depend

