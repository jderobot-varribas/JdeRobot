cmake_minimum_required(VERSION 2.8)
project(JderobotPushInterfaces)


## Dependencies
include_directories(
	${INTERFACES_CPP_DIR}
)

link_directories(
	${INTERFACES_CPP_DIR}
)


## Project
include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}/include
)

# Headers trick for IDEs
file(GLOB_RECURSE headers "include/**")
add_library(${PROJECT_NAME}_headers EXCLUDE_FROM_ALL ${headers})
set_target_properties(${PROJECT_NAME}_headers PROPERTIES LINKER_LANGUAGE CXX)


set(SOURCES
	src/imageproviderimpl.cpp
	src/camerabaseimpl.cpp
	src/pushimageproviderimpl.cpp
	src/pushcameraimpl.cpp
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

# Ice
target_link_libraries(${PROJECT_NAME}
	Ice
	IceUtil
	JderobotInterfaces
	${ZeroCIce_LIBRARIES}
)

# Application
set_target_properties(${PROJECT_NAME} PROPERTIES COMPILE_FLAGS "-Wall -Wextra")


## Install
install(TARGETS ${PROJECT_NAME}
    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_PREFIX}
    LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/jderobot
)

## Export library variables (like find_package)
# ToDo: create a macro at cmake/tools/find_package-declarer.cmake
set(${PROJECT_NAME}_FOUND 1 CACHE BOOL "Find(${PROJECT_NAME})")
set(${PROJECT_NAME}_INCLUDE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/include" CACHE PATH "Find(${PROJECT_NAME})")
set(${PROJECT_NAME}_LIBRARY_DIRS "${CMAKE_CURRENT_BINARY_DIR}" CACHE PATH "Find(${PROJECT_NAME})")
set(${PROJECT_NAME}_LIBRARIES "${PROJECT_NAME}" CACHE STRINGS "Find(${PROJECT_NAME})")

