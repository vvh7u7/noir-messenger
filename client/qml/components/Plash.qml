import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Item {
    id: root

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