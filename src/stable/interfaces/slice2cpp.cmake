cmake_minimum_required(VERSION 2.8.4)

set(SLICE_CPP_DIR  ${CMAKE_CURRENT_BINARY_DIR}/cpp)


foreach(slice_rel_path ${SLICE_FILES})
    get_filename_component(slice_name ${slice_rel_path} NAME_WE)
    get_filename_component(slice_file_name ${slice_rel_path} NAME)
    get_filename_component(slice_rel_dir   ${slice_rel_path} PATH) # PATH for cmake <= 2.8.11
    set(slice_abs_path  ${SLICE_DIRECTORY}/${slice_rel_path}) # get_filename_component() relative to absolute relies in cmake_current_source_dir. Not valid fot his setup

    ### CPP
    set(target_directory ${SLICE_CPP_DIR}/${slice_rel_dir})
    file(MAKE_DIRECTORY ${target_directory})
    execute_process(
        WORKING_DIRECTORY ${target_directory}
        COMMAND slice2cpp ${slice_abs_path} -I${SLICE_DIRECTORY} --output-dir ${target_directory} --include-dir ${slice_rel_dir}
        INPUT_FILE ${slice_abs_path}
    )
    #LIST(APPEND SLICE_CPP_GENERATED ${target_directory}/${slice_name}.h) # fetching .h files relies on include_directories()
    LIST(APPEND SLICE_CPP_GENERATED ${target_directory}/${slice_name}.cpp)
endforeach()



### CPP
include_directories(${SLICE_CPP_DIR})
add_library (JderobotInterfaces SHARED ${SLICE_CPP_GENERATED})
target_link_libraries(JderobotInterfaces ${ice2_LIBRARIES})

add_subdirectory(pushinterfaces)

