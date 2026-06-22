import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "qrc:/qml/widgets"
import "qrc:/qml/components"

Item {
    id: root

    Page {
        id: page
        anchors.fill: parent

        RowLayout {
            anchors.fill: parent
            Card {
                id: servers
                color: "black"
                Label {
                    text: "Server"
                }
                Column{

                }
            }
        }
    }
}