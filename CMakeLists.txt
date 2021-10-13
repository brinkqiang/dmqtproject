cmake_minimum_required(VERSION 3.8)

project(dmqtproject)

LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
INCLUDE(cmake/ModuleImport.cmake)
INCLUDE(cmake/ModuleCompileOptions.cmake)
ModuleSetCompileOptions()
ModuleSetWinCompilerFlags()

# Find includes in the build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

option(STATIC_QT "Use static Qt5 libraries" OFF)

if(STATIC_QT)
    set(QT_PREFIX StaticQt5)
else()
    set(QT_PREFIX Qt5)
endif()

set(QT5_PKGS Core Widgets Gui Network Sql)

set(QT5_LIBS "")

foreach(pkg ${QT5_PKGS})
    find_package(${QT_PREFIX}${pkg} REQUIRED)
    list(APPEND QT5_LIBS ${QT_PREFIX}::${pkg})
endforeach()

# Turn on automatic invocation of the MOC
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

# Tell CMake to create the helloworld executable
add_executable(hello
    ${CMAKE_CURRENT_SOURCE_DIR}/tools/hello/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/tools/hello/mainwindow.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/tools/hello/mainwindow.ui
    ${CMAKE_CURRENT_SOURCE_DIR}/tools/hello/resources.qrc)

# Add the Qt5 Widgets for linking
target_link_libraries(hello ${QT5_LIBS})
