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
include CMakeFiles/Navigation.AUV.Navigation.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Navigation.AUV.Navigation.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Navigation.AUV.Navigation.dir/flags.make

CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o: CMakeFiles/Navigation.AUV.Navigation.dir/flags.make
CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o: src/Navigation/AUV/Navigation/Task.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Navigation::AUV::Navigation::Task, NavigationAUVNavigationTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -o CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o -c /home/autonaut/dune_all/dune/src/Navigation/AUV/Navigation/Task.cpp

CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Navigation::AUV::Navigation::Task, NavigationAUVNavigationTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -E /home/autonaut/dune_all/dune/src/Navigation/AUV/Navigation/Task.cpp > CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.i

CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Navigation::AUV::Navigation::Task, NavigationAUVNavigationTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -S /home/autonaut/dune_all/dune/src/Navigation/AUV/Navigation/Task.cpp -o CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.s

CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o.requires:

.PHONY : CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o.requires

CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o.provides: CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o.requires
	$(MAKE) -f CMakeFiles/Navigation.AUV.Navigation.dir/build.make CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o.provides.build
.PHONY : CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o.provides

CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o.provides.build: CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o


# Object files for target Navigation.AUV.Navigation
Navigation_AUV_Navigation_OBJECTS = \
"CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o"

# External object files for target Navigation.AUV.Navigation
Navigation_AUV_Navigation_EXTERNAL_OBJECTS =

libNavigation.AUV.Navigation.a: CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o
libNavigation.AUV.Navigation.a: CMakeFiles/Navigation.AUV.Navigation.dir/build.make
libNavigation.AUV.Navigation.a: CMakeFiles/Navigation.AUV.Navigation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libNavigation.AUV.Navigation.a"
	$(CMAKE_COMMAND) -P CMakeFiles/Navigation.AUV.Navigation.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Navigation.AUV.Navigation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Navigation.AUV.Navigation.dir/build: libNavigation.AUV.Navigation.a

.PHONY : CMakeFiles/Navigation.AUV.Navigation.dir/build

CMakeFiles/Navigation.AUV.Navigation.dir/requires: CMakeFiles/Navigation.AUV.Navigation.dir/src/Navigation/AUV/Navigation/Task.cpp.o.requires

.PHONY : CMakeFiles/Navigation.AUV.Navigation.dir/requires

CMakeFiles/Navigation.AUV.Navigation.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Navigation.AUV.Navigation.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Navigation.AUV.Navigation.dir/clean

CMakeFiles/Navigation.AUV.Navigation.dir/depend:
	cd /home/autonaut/dune_all/dune && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune/CMakeFiles/Navigation.AUV.Navigation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Navigation.AUV.Navigation.dir/depend

