import QtQuick
import QtQuick.Controls
import QtQuick.Effects

import ThemeEngine

Control {
    id: root

    property url icon: "about:blank"
    property color colorNormal: Theme.color("textPrimary")
    property color colorHovered: Theme.color("primaryHover")
    property color colorPressed: Theme.color("primaryPressed")

    implicitWidth: 32
    implicitHeight: 32
    padding: 6

    HoverHandler { id: hoverHandler }
    TapHandler { id: tapHandler }

    contentItem: Image {
        id: iconImage
        source: (root.icon && root.icon !== "about:blank") ? root.icon : ""

        sourceSize.width: parent.width
        sourceSize.height: parent.height
        fillMode: Image.PreserveAspectFit
        anchors.centerIn: parent

        layer.enabled: source.toString() !== ""
        layer.effect: MultiEffect {
            colorization: 1.0
            colorizationColor: tapHandler.pressed  ? root.colorPressed  :
                hoverHandler.hovered ? root.colorHovered  :
                    root.colorNormal

            Behavior on colorizationColor {
                ColorAnimation { duration: 120 }
            }
        }
    }

    background: null
}