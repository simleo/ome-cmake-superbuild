# Configure icu
include("${EP_SCRIPT_CONFIG}")
include("${GENERIC_CMAKE_ENVIRONMENT}")

if(WIN32) # Use appropriate MSVC solution

  message(STATUS "Bootstrapping icu (Windows)")

else(WIN32)

  message(STATUS "Bootstrapping icu (Unix)")

  set(ENV{CC} "${ICU_C}")
  set(ENV{CXX} "${ICU_CXX}")

  execute_process(COMMAND "${SOURCE_DIR}/source/configure"
                          "--prefix=${OME_EP_INSTALL_DIR}"
                          "--libdir=${OME_EP_LIB_DIR}"
                          "CXXFLAGS=${EP_CXXFLAGS}"
                          "LDFLAGS=${EP_LDFLAGS}"
                  WORKING_DIRECTORY ${BUILD_DIR}
                  RESULT_VARIABLE configure_result)

endif(WIN32)

if (configure_result)
  message(FATAL_ERROR "icu: Configure failed")
endif()
