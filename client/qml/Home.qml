import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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
            id: appBar
            width: parent.width
            color: Theme.color("surface")

            IconButton {
                id: menuButton
                icon: Theme.icon("menu")
            }
            Text {
                text: "Noir Messenger"; font.pixelSize: 18
                Layout.fillWidth: true
                color: Theme.color("textPrimary")
            }
            IconButton {
                id: searchButton
                icon: Theme.icon("search")
            }
        }

        ListView {
            id: chatList

            anchors.fill: parent
            anchors.margins: 0//4
            spacing: 0//4
            clip: false

            ListModel {
                id: fruitModel
                ListElement { userName: "User"; lastMessage: "Last message"; lastTime: "Time" }
                ListElement { userName: "User"; lastMessage: "Last message"; lastTime: "Time" }
                ListElement { userName: "User"; lastMessage: "Last message"; lastTime: "Time" }
                ListElement { userName: "User"; lastMessage: "Last message"; lastTime: "Time" }
                ListElement { userName: "User"; lastMessage: "Last message"; lastTime: "Time" }
            }
            //ChatEngine.chatList
            model: fruitModel

            delegate: ChatItem {
                userName: model.userName
                lastMessage: model.lastMessage
                lastTime: model.lastTime

                //onClicked: ChatEngine.selectChat(chatId)
            }
        }
    }
}
