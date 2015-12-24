cmake_minimum_required(VERSION 2.8.4)

set(SLICE_JAVA_DIR ${CMAKE_CURRENT_BINARY_DIR}/java)

FILE(GLOB_RECURSE SLICE_FILES
    RELATIVE ${SLICE_DIRECTORY}
    "*.ice"
)


foreach(slice_rel_path ${SLICE_FILES})
    get_filename_component(slice_name ${slice_rel_path} NAME_WE)
    get_filename_component(slice_file_name ${slice_rel_path} NAME)
    get_filename_component(slice_rel_dir   ${slice_rel_path} PATH) # PATH for cmake <= 2.8.11
    set(slice_abs_path  ${SLICE_DIRECTORY}/${slice_rel_path}) # get_filename_component() relative to absolute relies in cmake_current_source_dir. Not valid fot his setup

    ### Java
    if (build_interfaces_java)
        set(target_directory ${SLICE_JAVA_DIR}/${slice_rel_dir})
        file(MAKE_DIRECTORY ${target_directory})
        execute_process(
            WORKING_DIRECTORY ${SLICE_JAVA_DIR}
            COMMAND slice2java ${slice_abs_path} -I${SLICE_DIRECTORY} --output-dir ${SLICE_JAVA_DIR}
            INPUT_FILE ${slice_abs_path}
        )
    endif()

endforeach()
