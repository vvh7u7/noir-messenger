set(DESKTOP_SOURCES
        Main.cpp
        resources.qrc
)

qt_add_executable(NoirMessengerDesktop
        ${DESKTOP_SOURCES}
)

target_link_libraries(NoirMessengerDesktop
        PUBLIC
            Qt6::Core
            Qt6::Gui
            Qt6::Qml
            Qt6::Widgets
            Qt6::Quick
            Qt6::Sql
        PRIVATE HaThemeEngine
)

set_target_properties(NoirMessengerDesktop PROPERTIES
        AUTORCC ON
        AUTOMOC ON
)

qt6_import_qml_plugins(NoirMessengerDesktop)
