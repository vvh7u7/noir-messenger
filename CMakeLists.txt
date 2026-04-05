cmake_minimum_required(VERSION 4.0.2)
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
        Sql
)

add_subdirectory(source)
add_subdirectory(libs/haqml-theme-engine/module)
