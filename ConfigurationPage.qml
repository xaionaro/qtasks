import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3

Rectangle {
    id: configurationPage
    objectName: "configurationPage"
    width: stackView.width
    height: stackView.height
    implicitWidth: 800
    implicitHeight: 600

    property var title: qsTr("configuration")

    Label {
        id: itsLabel
        width: parent.width
        text: qsTr("List of ITSs")
        horizontalAlignment: Text.AlignHCenter
    }

    RowLayout {
        id: itsLayout
        anchors.topMargin: itsLabel.height
        anchors.bottomMargin: addButton.height
        anchors.fill: parent
    }

    Button {
        id: addButton
        width: parent.width
        text: qsTr("ADD")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }
}



