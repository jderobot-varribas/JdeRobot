if( ICE_PY_MODULES AND NUMPY_MODULES AND MATPLOTLIB_PY_MODULES)
	#instal	
	INSTALL (FILES refereeViewer.py refereeViewer.cfg
		DESTINATION share/jderobot/python/refereeViewer
		OPTIONAL
		COMPONENT core
	)
	INSTALL (PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/refereeViewer DESTINATION bin OPTIONAL COMPONENT core)

endif(ICE_PY_MODULES AND NUMPY_MODULES AND MATPLOTLIB_PY_MODULES)
