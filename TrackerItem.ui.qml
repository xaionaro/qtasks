import QtQuick 2.4
import QtQuick.Controls 2.14

Item {
    width: 400
    height: 46
    anchors.fill: parent

    Column {
        id: column
        anchors.fill: parent

        TextInput {
            id: name
            text: qsTr("new tracker")
            autoScroll: false
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 110
            anchors.leftMargin: 10
            anchors.bottomMargin: 5
            anchors.topMargin: 5
            anchors.fill: parent
            renderType: Text.NativeRendering
            font.pixelSize: 24
        }

        Switch {
            id: enable
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 45
        }
    }

    RoundButton {
        id: configButton
        x: 360
        y: 8
        text: "\u2699"
        padding: 0
        leftPadding: 0
        topPadding: 0
        font.pointSize: Qt.application.font.pixelSize * 1.5
    }

}
