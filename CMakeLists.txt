cmake_minimum_required(VERSION 4.3.1)
project(NoirMessenger VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)

set(AUTOMOC ON)
set(AUTORCC ON)
set(AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS
        Core
        Gui
        Qml
        Widgets
        Quick
        Svg
        Sql
)

option(BUILD_THEME_ENGINE_SUBMODULE "Build theme engine from submodule" ON)

if(BUILD_THEME_ENGINE_SUBMODULE)
    add_subdirectory(libs/haqml-theme-engine/module)
endif()

add_subdirectory(libs/noir-protocol)

add_subdirectory(client)
