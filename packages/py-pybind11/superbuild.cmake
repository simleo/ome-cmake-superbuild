# py-pybind11 superbuild

# Set dependency list
ome_add_dependencies(py-pybind11
                     TYPE tool
                     THIRD_PARTY_DEPENDENCIES py-setuptools)

ExternalProject_Add(${EP_PROJECT}
  ${OME_EP_COMMON_ARGS}
  URL "https://pypi.python.org/packages/source/n/pybind11/pybind11-2.1.1.tar.gz"
  URL_HASH "SHA512=3c053b953957ae5da8c38802327c4aa861cc62d2b9d95b436be50b66530d19826232272ff633adae74c02f19042749a95b2e4c8dc2fe8a1e52d2c9b584d73cf0"
  SOURCE_DIR "${EP_SOURCE_DIR}"
  BINARY_DIR "${EP_BINARY_DIR}"
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_DIR ""
  INSTALL_COMMAND ${CMAKE_COMMAND}
    "-DSOURCE_DIR:PATH=${EP_SOURCE_DIR}"
    "-DBUILD_DIR:PATH=${EP_BINARY_DIR}"
    "-DCONFIG:INTERNAL=$<CONFIG>"
    "-DEP_SCRIPT_CONFIG:FILEPATH=${EP_SCRIPT_CONFIG}"
    -P "${GENERIC_PYTHON_INSTALL}"
  DEPENDS
    ${EP_PROJECT}-prerequisites
)
