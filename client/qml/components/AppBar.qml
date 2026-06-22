import QtQuick
import QtQuick.Layouts


Item {
    id: root
    width: parent.width
    height: 56

    default property alias contentData: content.data

    Rectangle {
        id: background
        anchors.fill: parent
        color: "red"
    }

    RowLayout {
        id: content
        anchors.fill: parent
        anchors.margins: 8
    }
}