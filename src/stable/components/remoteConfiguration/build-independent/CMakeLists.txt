 cmake_minimum_required(VERSION 2.8)
SET( SOURCE_FILES ../remoteConfiguration.cpp ../myparser.cpp)
SET( LIBS_DIR /usr/local/lib/jderobot/)

include_directories(
	  /usr/local/include/jderobot
)

add_executable (remoteConfiguration  ${SOURCE_FILES})
include(FindPkgConfig)
#automated gsl
PKG_CHECK_MODULES(gsl REQUIRED gsl)
include_directories(${gsl_INCLUDE_DIRS})
link_directories(${gsl_LIBRARY_DIRS})
#automated libxml++
PKG_CHECK_MODULES(libxmlpp REQUIRED libxml++-2.6)
include_directories(${libxmlpp_INCLUDE_DIRS})
link_directories(${libxmlpp_LIBRARY_DIRS})

#automated gtk
PKG_CHECK_MODULES(gtkmm REQUIRED gtkmm-2.4)
include_directories(${gtkmm_INCLUDE_DIRS})
link_directories(${gtkmm_LIBRARY_DIRS})
#automated glademm
PKG_CHECK_MODULES(libglademm REQUIRED libglademm-2.4)
include_directories(${libglademm_INCLUDE_DIRS})
link_directories(${libglademm_LIBRARY_DIRS})
#automated gtkglextmm
PKG_CHECK_MODULES(gtkglextmm REQUIRED gtkglextmm-x11-1.2)
include_directories(${gtkglextmm_INCLUDE_DIRS})
link_directories(${gtkglextmm_LIBRARY_DIRS})



#manual ICE
FIND_PATH( Ice_INCLUDE_DIR NAMES Ice/Ice.h  PATHS ENV C++LIB ENV)
 
IF( Ice_INCLUDE_DIR )
    FIND_LIBRARY( Ice_LIBRARY1 NAMES Ice PATHS ENV C++LIB ENV PATH PATH_SUFFIXES lib lib64 )
    FIND_LIBRARY( Ice_LIBRARY2 NAMES IceUtil PATHS ENV C++LIB ENV PATH PATH_SUFFIXES lib lib64)
    SET (Ice_LIBRARIES ${Ice_LIBRARY1} ${Ice_LIBRARY2})
    IF( Ice_LIBRARIES )
		MESSAGE ("-- Ice found at ${Ice_LIBRARIES}")
		include_directories(${Ice_INCLUDE_DIR})
		link_directories(${Ice_LIBRARIES})
    ENDIF( Ice_LIBRARIES )
ENDIF(Ice_INCLUDE_DIR)

IF(NOT Ice_LIBRARIES)
		MESSAGE ("*** Ice not found")
ENDIF()




set( CMAKE_CXX_FLAGS "-Wno-deprecated " ) # Opciones para el compilador




TARGET_LINK_LIBRARIES(remoteConfiguration
  ${gsl_LIBRARIES}
  ${Ice_LIBRARIES}
  ${libxmlpp_LIBRARIES}
  ${gtkglextmm_LIBRARIES}
  ${libglademm_LIBRARIES}
  ${gtkmm_LIBRARIES}
  ${LIBS_DIR}/libJderobotInterfaces.so
  ${LIBS_DIR}/libjderobotutil.so
)
