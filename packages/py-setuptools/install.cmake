include("${EP_SCRIPT_CONFIG}")
include("${GENERIC_CMAKE_ENVIRONMENT}")

file(TO_NATIVE_PATH "${OME_EP_TOOL_DIR}" NATIVE_TOOL_DIR)

set(ENV{PYTHONPATH} "${NATIVE_TOOL_DIR}")

execute_process(COMMAND python setup.py install "--prefix=${NATIVE_TOOL_DIR}" --single-version-externally-managed --record=installed.txt
                WORKING_DIRECTORY "${SOURCE_DIR}"
                RESULT_VARIABLE install_result)

if(install_result)
  message(FATAL_ERROR "py-setuptools: install failed")
endif()
