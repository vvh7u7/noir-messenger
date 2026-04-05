import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    height: 650
    width: 800
    title: "NoirMessenger"
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