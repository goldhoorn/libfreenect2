#

# Try to find GLEW library and include path.
# Once done this will define
#
# GLEW_FOUND
# GLEW_INCLUDE_DIR
# GLEW_LIBRARY
#

include(FindPackageHandleStandardArgs)

if (WIN32)
    find_path( GLEW_INCLUDE_DIR
        NAMES
            GL/glew.h
        PATHS
            $ENV{GLEW_ROOT_DIR}/include
            DOC "The directory where GL/glew.h resides" )
			
    if(ARCH STREQUAL "x86")
      find_library( GLEW_LIBRARY
          NAMES
              glew32mx glew32mxs
          PATHS
              "$ENV{GLEW_ROOT_DIR}/lib/Release MX/win32"
              "$ENV{GLEW_ROOT_DIR}/lib/Release MX/win32"
              DOC "The GLEW library")
    else()
      find_library( GLEW_LIBRARY
          NAMES
              glew32mx glew32mxs
          PATHS
              "$ENV{GLEW_ROOT_DIR}/lib/Release MX/x64"
              "$ENV{GLEW_ROOT_DIR}/lib/Release MX/x64"
              DOC "The GLEW library")
    endif()
else(WIN32)
    find_path( GLEW_INCLUDE_DIR
        NAMES
            GL/glew.h
        PATHS
            $ENV{GLEW_ROOT_DIR}/include
            /usr/include
            /usr/local/include
            /sw/include
            /opt/local/include
            NO_DEFAULT_PATH
            DOC "The directory where GL/glew.h resides"
    )
    find_library( GLEW_LIBRARY
        NAMES
            GLEW glew
        PATHS
            $ENV{GLEW_ROOT_DIR}/lib
            /usr/lib64
            /usr/lib
            /usr/local/lib64
            /usr/local/lib
            /sw/lib
            /opt/local/lib
            NO_DEFAULT_PATH
            DOC "The GLEW library")
endif ()

find_package_handle_standard_args(GLEW DEFAULT_MSG
    GLEW_INCLUDE_DIR
    GLEW_LIBRARY
)

mark_as_advanced( GLEW_FOUND )