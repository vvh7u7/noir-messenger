import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

import ThemeEngine

ApplicationWindow {
    id: root
    height: 650
    width: 900
    title: "NoirMessenger - " + (Theme.meta ? Theme.meta["name"] : "NoneTheme")
    background: Rectangle {
        color: Theme.color("background")
    }
    visible: true

    property bool isWideMode: width >= 600
    property bool isChatOpen: false
    property real homeWidth: 300

    property var chatStack: null

    Loader {
        id: mainLoader
        anchors.fill: parent
        sourceComponent: isWideMode ? wideModeComponent : narrowModeComponent
    }

    Component {
        id: wideModeComponent

        SplitView {
            id: splitView
            anchors.fill: parent

            /*Settings {
                SplitView.preferredWidth: root.homeWidth
                SplitView.minimumWidth: root.minHomeWidth
                SplitView.maximumWidth: root.maxHomeWidth
            }*/

            Home {
                SplitView.preferredWidth: root.homeWidth
                SplitView.minimumWidth: root.minHomeWidth
                SplitView.maximumWidth: root.maxHomeWidth
            }

            Chat {
                SplitView.fillWidth: true
            }

            //onResizingChanged: { if (!resizing) { root.homeWidth = splitView.children[0].width } }
        }
    }

    Component {
        id: narrowModeComponent

        Home {
            id: home
        }
    }
}
