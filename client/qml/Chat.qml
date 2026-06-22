import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import ThemeEngine

import "qrc:/qml/components"
import "qrc:/qml/controls"

Item {
    id: root

    Page {
        id: page
        anchors.fill: parent
        background: Rectangle {
            color: Theme.colors.background
        }
        header: Bar {
            id: chatBar
            width: parent.width
            color: Theme.color("surface")

            IconButton {
                id: backButton
                icon: Theme.icon("arrow_back")
            }
            Text {
                text: "Chat"
                Layout.fillWidth: true
                color: Theme.color("textPrimary")
            }
        }
        Rectangle {
            id: content
        }
        footer: Bar {
            id: bottomBar
            width: parent.width
            color: Theme.color("surface")

            IconButton {
                id: attachFileButton
                icon: Theme.icon("attach_file")
            }
            TextField {
                Layout.fillWidth: true
            }
            IconButton {
                id: recordCircleButton
                icon: Theme.icon("camera")
            }
            IconButton {
                id: sendButton
                icon: Theme.icon("send")
            }
        }
    }
}
