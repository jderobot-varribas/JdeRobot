SET(CMAKE_MODULE_PATH
	${CMAKE_MODULE_PATH}
	"${CMAKE_CURRENT_LIST_DIR}/CMake"
)

SET(slice_path /usr/share/slice)
FIND_PACKAGE(ZeroCIceUtil)
FIND_PACKAGE(ZeroCIceStorm)
FIND_PACKAGE(ZeroCIce)
	IF( ZeroCIceStorm_LIBRARY )
		IF( ZeroCIceUtil_LIBRARY )
			MESSAGE("*** ICE ok")
			include_directories(${ZeroCIceUtil_INCLUDE_DIR})
			link_directories(${ZeroCIceUtil_LIBRARY})
			include_directories(${ZeroCIceCore_INCLUDE_DIR})
			link_directories(${ZeroCIceCore_LIBRARY})
			include_directories(${ZeroCIceStorm_INCLUDE_DIR})
			link_directories(${ZeroCIceStorm_LIBRARY})
			include_directories(${ZeroCIce_INCLUDE_DIR})
			link_directories(${ZeroCIce_LIBRARIES})

			list(APPEND DEPS libzeroc-ice35 libiceutil35 libicestorm35)
			list(APPEND DEPS_DEV ice35-slice ice35-translators libzeroc-ice35-dev ice35-services)
			

		ENDIF( ZeroCIceUtil_LIBRARY )
	ENDIF( ZeroCIceStorm_LIBRARY )

IF(NOT  ZeroCIceStorm_LIBRARY )
	MESSAGE(FATAL_ERROR "*** IceStorm not found")
ENDIF()

IF(NOT  ZeroCIceUtil_LIBRARY )
	MESSAGE(FATAL_ERROR "*** IceUtil not found")
ENDIF()

