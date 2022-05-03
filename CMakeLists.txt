cmake_minimum_required(VERSION 3.8)

SET(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/../dmvcpkg/vcpkg/scripts/buildsystems/vcpkg.cmake")

project(dmqtproject)

LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
INCLUDE(cmake/ModuleImport.cmake)
INCLUDE(cmake/ModuleCompileOptions.cmake)
ModuleSetCompileOptions()
ModuleSetWinCompilerFlags()

# Find includes in the build directories

find_package(Qt5 COMPONENTS Core Widgets Gui REQUIRED )

IF(Qt5_FOUND)
    MESSAGE(STATUS "Qt5_FOUND ${QT5_LIBRARIES}")
ENDIF(Qt5_FOUND)

# Turn on automatic invocation of the MOC
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

# Tell CMake to create the helloworld executable
add_executable(helloworld
    ${CMAKE_CURRENT_SOURCE_DIR}/tools/helloworld/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/tools/helloworld/mainwindow.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/tools/helloworld/mainwindow.ui
    ${CMAKE_CURRENT_SOURCE_DIR}/tools/helloworld/resources.qrc)

# Add the Qt5 linking
target_link_libraries(helloworld Qt5::Widgets Qt5::Core Qt5::Gui)
