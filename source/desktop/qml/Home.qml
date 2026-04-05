import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "qrc:/qml/components"
import "qrc:/qml/controls"

Item {
    id: root

    Bar {
        id: appBar
        width: parent.width

        Button {
            text: "Menu"
        }
        Text {
            text: "Noir Messenger"; font.pixelSize: 18
        }
        Button {
            text: "Search"
        }
    }

    ListView {
        id: chatList

        anchors.fill: parent
        anchors.margins: 0//4
        topMargin: appBar.height
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