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
include CMakeFiles/Transports.TCP.Client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Transports.TCP.Client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Transports.TCP.Client.dir/flags.make

CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o: CMakeFiles/Transports.TCP.Client.dir/flags.make
CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o: src/Transports/TCP/Client/Task.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Transports::TCP::Client::Task, TransportsTCPClientTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -o CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o -c /home/autonaut/dune_all/dune/src/Transports/TCP/Client/Task.cpp

CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Transports::TCP::Client::Task, TransportsTCPClientTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -E /home/autonaut/dune_all/dune/src/Transports/TCP/Client/Task.cpp > CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.i

CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -DDUNE_TASK="DUNE_TASK_EXPORT(::Transports::TCP::Client::Task, TransportsTCPClientTask)"  -fexceptions -Wno-long-long -Wextra -Wformat -Wformat-security -Wno-missing-field-initializers -fdiagnostics-show-option -Wall -Wshadow -pedantic -S /home/autonaut/dune_all/dune/src/Transports/TCP/Client/Task.cpp -o CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.s

CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o.requires:

.PHONY : CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o.requires

CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o.provides: CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o.requires
	$(MAKE) -f CMakeFiles/Transports.TCP.Client.dir/build.make CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o.provides.build
.PHONY : CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o.provides

CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o.provides.build: CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o


# Object files for target Transports.TCP.Client
Transports_TCP_Client_OBJECTS = \
"CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o"

# External object files for target Transports.TCP.Client
Transports_TCP_Client_EXTERNAL_OBJECTS =

libTransports.TCP.Client.a: CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o
libTransports.TCP.Client.a: CMakeFiles/Transports.TCP.Client.dir/build.make
libTransports.TCP.Client.a: CMakeFiles/Transports.TCP.Client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/autonaut/dune_all/dune/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libTransports.TCP.Client.a"
	$(CMAKE_COMMAND) -P CMakeFiles/Transports.TCP.Client.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Transports.TCP.Client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Transports.TCP.Client.dir/build: libTransports.TCP.Client.a

.PHONY : CMakeFiles/Transports.TCP.Client.dir/build

CMakeFiles/Transports.TCP.Client.dir/requires: CMakeFiles/Transports.TCP.Client.dir/src/Transports/TCP/Client/Task.cpp.o.requires

.PHONY : CMakeFiles/Transports.TCP.Client.dir/requires

CMakeFiles/Transports.TCP.Client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Transports.TCP.Client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Transports.TCP.Client.dir/clean

CMakeFiles/Transports.TCP.Client.dir/depend:
	cd /home/autonaut/dune_all/dune && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune /home/autonaut/dune_all/dune/CMakeFiles/Transports.TCP.Client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Transports.TCP.Client.dir/depend

