import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Stack")

    Shortcut {
        sequence: StandardKey.Quit
        context: Qt.ApplicationShortcut
        onActivated: Qt.quit()
    }

    Shortcut {
        sequence: "F1"
        context: Qt.ApplicationShortcut
        onActivated: tasksButton.clicked()
    }

    Shortcut {
        sequence: "F2"
        context: Qt.ApplicationShortcut
        onActivated: activityLogButton.clicked()
    }

    Shortcut {
        sequence: "F3"
        context: Qt.ApplicationShortcut
        onActivated: notesButton.clicked()
    }

    Shortcut {
        sequence: "F4"
        context: Qt.ApplicationShortcut
        onActivated: configurationButton.clicked()
    }

    header: ToolBar {
        id: toolBar
        visible: true
        contentHeight: drawerButton.implicitHeight

        RowLayout {
            id: toolBarRow
            ToolButton {
                id: drawerButton
                text: stackView.depth > 1 ? "\u25C0" : "\u2630"
                font.pixelSize: Qt.application.font.pixelSize * 1.6
                ToolTip.visible: hovered
                ToolTip.text: qsTr("left menu")
                onClicked: {
                    if (stackView.depth > 1) {
                        stackView.pop()
                    } else {
                        drawer.open()
                    }
                }
            }
            ToolSeparator{
                visible: window.width > 700
            }
            ToolButton {
                id: tasksButton
                visible: window.width > 700
                text: "\u2611"
                font.family: "Times New Roman"
                font.pixelSize: Qt.application.font.pixelSize * 1.6
                ToolTip.visible: hovered
                ToolTip.text: qsTr("tasks [F1]")
                background: Rectangle {
                    opacity: mainArea.currentIndex == 0 ? 0.3 : 0
                    color: "#00FF00"
                }
                onClicked: {
                    mainArea.currentIndex = 0
                    mainArea.currentItem.children[0].forceActiveFocus()
                }
            }
            ToolButton {
                id: activityLogButton
                visible: window.width > 700
                text: "\u23F1"
                font.family: "Times New Roman"
                ToolTip.visible: hovered
                ToolTip.text: qsTr("activity log [F2]")
                font.pixelSize: Qt.application.font.pixelSize * 1.6
                background: Rectangle {
                    opacity: mainArea.currentIndex == 1 ? 0.3 : 0
                    color: "#00FF00"
                }
                onClicked: {
                    mainArea.currentIndex = 1
                    mainArea.currentItem.children[0].forceActiveFocus()
                }
            }
            ToolButton {
                id: notesButton
                visible: window.width > 700
                text: "\u270F"
                font.family: "Times New Roman"
                ToolTip.visible: hovered
                ToolTip.text: qsTr("notes [F3]")
                font.pixelSize: Qt.application.font.pixelSize * 1.6
                background: Rectangle {
                    opacity: mainArea.currentIndex == 2 ? 0.3 : 0
                    color: "#00FF00"
                }
                onClicked: {
                    mainArea.currentIndex = 2
                    mainArea.currentItem.children[0].forceActiveFocus()
                }
            }
            ToolButton {
                id: configurationButton
                visible: window.width > 700
                text: "\u2699"
                font.family: "Times New Roman"
                ToolTip.visible: hovered
                ToolTip.text: qsTr("configuration [F4]")
                font.pixelSize: Qt.application.font.pixelSize * 1.6
                background: Rectangle {
                    opacity: mainArea.currentIndex == 3 ? 0.3 : 0
                    color: "#00FF00"
                }
                onClicked: {
                    mainArea.currentIndex = 3
                    mainArea.currentItem.children[0].forceActiveFocus()
                }
            }
            ToolSeparator{}
            Label {
                visible: window.width > 400
                text: mainArea.currentItem.children[0].title
            }
            ToolSeparator{}
            ScrollView {
                id: statusBar
                Layout.fillHeight: true
                Layout.fillWidth: true

                Rectangle {
                    id: rectangle
                    anchors.fill: parent
                    Label {
                        text: "QTasks"
                        anchors.verticalCenter: parent.verticalCenter
                        color: "gray"
                    }
                }
            }
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            id: drawerItems
            anchors.fill: parent
            ItemDelegate {
                text: qsTr("&tasks")
                width: parent.width
                onClicked: {
                    mainArea.currentIndex = 0
                    drawer.close()
                    mainArea.currentItem.children[0].forceActiveFocus()
                }
            }
            ItemDelegate {
                text: qsTr("&activity log")
                width: parent.width
                onClicked: {
                    mainArea.currentIndex = 1
                    drawer.close()
                    mainArea.currentItem.children[0].forceActiveFocus()
                }
            }
            ItemDelegate {
                text: qsTr("&notes")
                width: parent.width
                onClicked: {
                    mainArea.currentIndex = 2
                    drawer.close()
                    mainArea.currentItem.children[0].forceActiveFocus()
                }
            }
            ItemDelegate {
                text: qsTr("configuration")
                width: parent.width
                onClicked: {
                    mainArea.currentIndex = 3
                    drawer.close()
                    mainArea.currentItem.children[0].forceActiveFocus()
                }
            }
            ItemDelegate {
                text: qsTr("quit")
                width: parent.width
                onClicked: {
                    Qt.callLater(Qt.quit)
                }
            }
        }
    }

    StackView {
        id: stackView
        Shortcut {
            sequence: "Escape"
            onActivated: {
                stackView.pop()
                mainArea.currentItem.children[0].forceActiveFocus()
            }
        }

        anchors.fill: parent
        initialItem: SwipeView {
            id: mainArea
            anchors.fill: parent
            Item {
                TasksPage {
                    id: tasksPage
                    anchors.fill: parent
                }
            }
            Item {
                ActivityLogPage {
                    id: activityLogPage
                    anchors.fill: parent
                }
            }
            Item {
                NotesPage {
                    id: notesPage
                    anchors.fill: parent
                }
            }
            Item {
                ConfigurationPage {
                    id: configurationPage
                    anchors.fill: parent
                }
            }
            onCurrentIndexChanged: {
                stackView.pop(mainArea)
                mainArea.currentItem.children[0].forceActiveFocus()
            }
        }
    }
}
