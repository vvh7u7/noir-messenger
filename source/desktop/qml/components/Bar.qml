import QtQuick
import QtQuick.Layouts


Item {
    id: root
    width: parent.width
    height: 40

    default property alias contentData: content.data
    property string color: "grey"

    Rectangle {
        id: background
        anchors.fill: parent
        color: root.color
    }

    RowLayout {
        id: content
        anchors.fill: parent
        anchors.margins: 2
    }
}