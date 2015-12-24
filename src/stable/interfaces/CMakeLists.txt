set(SLICE_NEW_STYLE "ON")
if (NOT DEFINED SLICE_NEW_STYLE)

include (${CMAKE_CURRENT_LIST_DIR}/slice/CMakeLists.txt)

include_directories(
        ${CMAKE_CURRENT_LIST_DIR}/cpp/jderobot
        ${CMAKE_CURRENT_LIST_DIR}/cpp/
)
add_library (JderobotInterfaces SHARED ${SOURCE_FILES} ${ICE_FILES})
TARGET_LINK_LIBRARIES(JderobotInterfaces ${ice2_LIBRARIES})

else()

### CMakeCache build control
if (NOT DEFINED build_interfaces_cpp)
    set(build_interfaces_cpp "ON" CACHE BOOL "Build Ice interfaces for CPP")
endif()
if (NOT DEFINED build_interfaces_java)
    set(build_interfaces_java "ON" CACHE BOOL "Build Ice interfaces for Java")
endif()
if (NOT DEFINED build_interfaces_python)
    set(build_interfaces_python "ON" CACHE BOOL "Build Ice interfaces for Python")
endif()

message(STATUS "Building ICE Interfaces for:")
if (build_interfaces_cpp)
    message(STATUS "\tCPP")
endif()
if (build_interfaces_java)
    message(STATUS "\tJava")
endif()
if (build_interfaces_python)
    message(STATUS "\tPython")
endif()



set(SLICE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/slice)
set(SLICE_CPP_DIR  ${CMAKE_CURRENT_BINARY_DIR}/cpp)
set(SLICE_PY_DIR   ${CMAKE_CURRENT_BINARY_DIR}/python)
set(SLICE_JAVA_DIR ${CMAKE_CURRENT_BINARY_DIR}/java)

FILE(GLOB_RECURSE SLICE_FILES
    RELATIVE ${SLICE_DIRECTORY}
    "*.ice"
)

### Trick to publich .ice files into CMake's sources
file(GLOB_RECURSE SLICE_DEFINITIONS "slice/**.ice")
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/dummy.c "")
add_library(JderobotInterfaces_Definitions ${CMAKE_CURRENT_BINARY_DIR}/dummy.c ${SLICE_DEFINITIONS})


### CPP
if (build_interfaces_cpp)
    include(slice2cpp.cmake)
endif()

### Python
if (build_interfaces_python)
    include(slice2python.cmake)
endif()

### Java
if (build_interfaces_java)
    include(slice2java.cmake)
endif()


endif(NOT DEFINED SLICE_NEW_STYLE)
