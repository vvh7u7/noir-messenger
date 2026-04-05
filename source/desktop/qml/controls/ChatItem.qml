import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

Button {
    id: root

    property string userName: "userName"
    property string lastMessage: "lastMessage"
    property string lastTime: "lastTime"

    width: parent ? parent.width : 300
    height: 64

    background: Rectangle {
        color: root.down ? "blue" : (root.hovered ? "darkblue" : "black")
        border.color: root.down ? "darkblue" : (root.hovered ? "blue" : "darkgrey")
    }

    RowLayout {
        id: content
        anchors.fill: parent
        anchors.margins: 2
        Rectangle {
            id: itemLeft
            height: parent.height; width: parent.height
            color: "red"
        }
        Rectangle {
            id: itemCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "orange"
        }
        Rectangle {
            id: itemRight
            height: parent.height; width: parent.height
            color: "green"
        }
    }
}