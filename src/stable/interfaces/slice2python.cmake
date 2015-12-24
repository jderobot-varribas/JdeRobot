
### Slice 2 Python
# Required parameters:
# SLICE_DIRECTORY : root directory of slice files
# SLICE_FILES : all ice files to be generated

cmake_minimum_required(VERSION 2.8.4)

set(SLICE_PY_DIR   ${CMAKE_CURRENT_BINARY_DIR}/python)

FILE(GLOB_RECURSE SLICE_FILES
    RELATIVE ${SLICE_DIRECTORY}
    "*.ice"
)

foreach(slice_rel_path ${SLICE_FILES})
    get_filename_component(slice_name ${slice_rel_path} NAME_WE)
    get_filename_component(slice_file_name ${slice_rel_path} NAME)
    get_filename_component(slice_rel_dir   ${slice_rel_path} PATH) # PATH for cmake <= 2.8.11
    set(slice_abs_path  ${SLICE_DIRECTORY}/${slice_rel_path}) # get_filename_component() relative to absolute relies in cmake_current_source_dir. Not valid fot his setup


    ### Step 1
    set(target_directory ${SLICE_PY_DIR}/${slice_rel_dir})
    file(MAKE_DIRECTORY ${target_directory})
    execute_process(
        WORKING_DIRECTORY ${SLICE_PY_DIR}
        COMMAND slice2py ${slice_abs_path} -I${SLICE_DIRECTORY} --output-dir ${target_directory} --all
        # py files will be placed at ${target_directory}
        # __init__.py will be placed at ${target_directory}/target_directory (creates a directory for each module)
        # tested but invalid: --prefix (not a '--include-dir' equivalent)
    )
    list(APPEND python_paths ${slice_rel_dir})

endforeach()


### Step2: patching __init__.py
## __init__.py are always placed in a dedicated subtree. This subtree
# was already done explicit, so we need to revert duplicated directories
list(REMOVE_DUPLICATES python_paths)
foreach(python_path ${python_paths})
    if(EXISTS ${SLICE_PY_DIR}/${python_path}/${python_path}/__init__.py)
        file(RENAME ${SLICE_PY_DIR}/${python_path}/${python_path}/__init__.py ${SLICE_PY_DIR}/${python_path}/__init__.py)
#            message(STATUS "__init__ moved: ${python_path}/${python_path}/__init__.py --> ${python_path}/__init__.py")
    endif()
endforeach()

## __init__ do not include submodules, so we need to append it
foreach(python_path ${python_paths})
    get_filename_component(parent_path   ${python_path} PATH)
    if(EXISTS ${SLICE_PY_DIR}/${parent_path}/__init__.py)
        get_filename_component(module_name   ${python_path} NAME)
        file(APPEND ${SLICE_PY_DIR}/${parent_path}/__init__.py "import ${module_name}\n")
    endif()
endforeach()

## Also try to remove unwanted directories. Since we can't list it due are
# created after, we need to overcome it by use all possible combinations
foreach(python_path_1 ${python_paths})
    foreach(python_path_2 ${python_paths})
        set(path_to_remove ${SLICE_PY_DIR}/${python_path_1}/${python_path_2})
        if (EXISTS "${path_to_remove}")
            file(REMOVE_RECURSE "${path_to_remove}")
        endif()
    endforeach()
endforeach()


### Install
install(DIRECTORY ${SLICE_PY_DIR}/
    DESTINATION /usr/lib/python2.7/
)

