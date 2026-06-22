set(SOURCES
        main.cpp
        source/core/storage/server_repository.cpp
        resources.qrc
        themes.qrc
)

qt_add_executable(NoirMessenger
        ${SOURCES}
)

target_include_directories(NoirMessenger PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_link_libraries(NoirMessenger
        PUBLIC
            Qt6::Core
            Qt6::Gui
            Qt6::Qml
            Qt6::Svg
            Qt6::Widgets
            Qt6::Quick
            Qt6::Sql
        PRIVATE
            HaThemeEngine
            NoirProtocol
)

set_target_properties(NoirMessenger PROPERTIES
        AUTORCC ON
        AUTOMOC ON
)

qt6_import_qml_plugins(NoirMessenger)
