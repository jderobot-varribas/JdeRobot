# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mikel/Escritorio/respository/test_repository/trunk/src/components/introrob

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mikel/Escritorio/respository/test_repository/trunk/src/components/introrob/build

# Include any dependencies generated for this target.
include ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/depend.make

# Include the progress variables for this target.
include ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/progress.make

# Include the compile flags for this target's objects.
include ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/flags.make

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/flags.make
../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o: ../../../libs/colorspaces/rgb2hsv.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mikel/Escritorio/respository/test_repository/trunk/src/components/introrob/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o"
	cd /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o   -c /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces/rgb2hsv.c

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/colorspacesshare.dir/rgb2hsv.c.i"
	cd /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces/rgb2hsv.c > CMakeFiles/colorspacesshare.dir/rgb2hsv.c.i

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/colorspacesshare.dir/rgb2hsv.c.s"
	cd /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces/rgb2hsv.c -o CMakeFiles/colorspacesshare.dir/rgb2hsv.c.s

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o.requires:
.PHONY : ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o.requires

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o.provides: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o.requires
	$(MAKE) -f ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/build.make ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o.provides.build
.PHONY : ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o.provides

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o.provides.build: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o
.PHONY : ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o.provides.build

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/flags.make
../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o: ../../../libs/colorspaces/rgb2yuv.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mikel/Escritorio/respository/test_repository/trunk/src/components/introrob/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o"
	cd /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o   -c /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces/rgb2yuv.c

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/colorspacesshare.dir/rgb2yuv.c.i"
	cd /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces/rgb2yuv.c > CMakeFiles/colorspacesshare.dir/rgb2yuv.c.i

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/colorspacesshare.dir/rgb2yuv.c.s"
	cd /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces/rgb2yuv.c -o CMakeFiles/colorspacesshare.dir/rgb2yuv.c.s

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o.requires:
.PHONY : ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o.requires

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o.provides: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o.requires
	$(MAKE) -f ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/build.make ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o.provides.build
.PHONY : ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o.provides

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o.provides.build: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o
.PHONY : ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o.provides.build

# Object files for target colorspacesshare
colorspacesshare_OBJECTS = \
"CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o" \
"CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o"

# External object files for target colorspacesshare
colorspacesshare_EXTERNAL_OBJECTS =

../../../libs/colorspaces/libcolorspaces.so: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o
../../../libs/colorspaces/libcolorspaces.so: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o
../../../libs/colorspaces/libcolorspaces.so: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/build.make
../../../libs/colorspaces/libcolorspaces.so: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared library libcolorspaces.so"
	cd /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/colorspacesshare.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/build: ../../../libs/colorspaces/libcolorspaces.so
.PHONY : ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/build

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/requires: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2hsv.c.o.requires
../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/requires: ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/rgb2yuv.c.o.requires
.PHONY : ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/requires

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/clean:
	cd /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces && $(CMAKE_COMMAND) -P CMakeFiles/colorspacesshare.dir/cmake_clean.cmake
.PHONY : ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/clean

../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/depend:
	cd /home/mikel/Escritorio/respository/test_repository/trunk/src/components/introrob/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mikel/Escritorio/respository/test_repository/trunk/src/components/introrob /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces /home/mikel/Escritorio/respository/test_repository/trunk/src/components/introrob/build /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces /home/mikel/Escritorio/respository/test_repository/trunk/src/libs/colorspaces/CMakeFiles/colorspacesshare.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ../../../libs/colorspaces/CMakeFiles/colorspacesshare.dir/depend
