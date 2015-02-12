# - Try to find GLFW
#
# Will define the following:
# GLFW_FOUND
# GLFW_INCLUDE_DIRS
# GLFW_LIBRARIES

IF(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
	find_path(GLFW_INCLUDE_DIRS glfw/glfw3.h DOC "GLFW include directory " HINTS $ENV{GLFW_ROOT}/include)
	
	find_library(GLFW_LIBRARIES NAMES glfw3dll.lib HINTS $ENV{GLFW_ROOT}/lib/)
	
ENDIF()
IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
	#TODO linux
	#find_path(GLFW_INCLUDE_DIRS glfw3.h DOC "GLFW include directory " HINTS /usr/include)
	
	#find_library(GLFW_LIBRARIES NAMES glfw.so glfw.a )
endif()

find_package_handle_standard_args(GLFW DEFAULT_MSG GLFW_INCLUDE_DIRS GLFW_LIBRARIES)