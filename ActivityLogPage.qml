import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

Rectangle {
    id: activityLogPage
    objectName: "activityLogPage"
    property var title: qsTr("activity log")

    signal dateRangeChange(string since, string until)
    signal select(int index, string taskID, QtObject item)
    signal openInBrowser(int index, string taskID, QtObject item)

    onDateRangeChange: backend.activityLogDateRangeChange(since, until)
    onSelect: backend.activityLogSelect(index, taskID, item)
    onOpenInBrowser: backend.activityLogOpenInBrowser(index, taskID, item)

    property var backgroundColorInactive0: "#EEEEEE"
    property var backgroundColorInactive1: "#FFFFFF"
    property var foregroundColorInactive: "#000000"
    property var backgroundColorActive: "#00FF00"
    property var foregroundColorActive: "#000000"
    property var backgroundColorContext: "#80FF80"
    property var foregroundColorContext: "#000000"

    ListModel {
        id: listModel
        Component.onCompleted: {
            if(APPEND_WITH_SAMPLE_VALUES) {
                listModel.append({
                                 date: "2020-01-01",
                                 time: "2h",
                                 taskID: "123",
                                 taskTitle: "task title",
                                 taskSummary: "task summary",
                                 comment: "... some comment ...",
                             })
            }
        }
    }

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        RowLayout {
            id: rowLayout
            Layout.fillWidth: true
            Calendar {
                id: sinceDate
                onSelectedDateChanged: {
                    if (untilDate.selectedDate < sinceDate.selectedDate) {
                        untilDate.selectedDate = sinceDate.selectedDate
                    }
                    activityLogPage.dateRangeChange(sinceDate.selectedDate, untilDate.selectedDate)
                }
            }
            Calendar {
                id: untilDate
                Layout.alignment: Qt.AlignRight
                onSelectedDateChanged: {
                    if (untilDate.selectedDate < sinceDate.selectedDate) {
                        sinceDate.selectedDate = untilDate.selectedDate
                    }
                    activityLogPage.dateRangeChange(sinceDate.selectedDate, untilDate.selectedDate)
                }
            }
        }

        ListView {
            id: listView
            currentIndex: -1
            Layout.fillHeight: true
            Layout.fillWidth: true
            delegate: Component {
                Item {
                    id: itemDelegate
                    property var backgroundColorDefault: index % 2 == 0 ? activityLogPage.backgroundColorInactive0 : activityLogPage.backgroundColorInactive1
                    property var backgroundColor: contextMenu.opened ? activityLogPage.backgroundColorContext : backgroundColorDefault
                    property var foregroundColorDefault: activityLogPage.foregroundColorInactive
                    property var foregroundColor: contextMenu.opened ? activityLogPage.foregroundColorContext : foregroundColorDefault


                    height: font.pixelSize*2.6
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    Rectangle {
                        anchors.fill: parent
                        color: listView.currentIndex == index ? activityLogPage.backgroundColorActive : itemDelegate.backgroundColor
                    }
                    Column {
                        anchors.right: parent.right
                        anchors.left: parent.left
                        RowLayout {
                            anchors.fill: parent
                            Column {
                                Layout.maximumWidth: parent.width / 5
                                Text {
                                    color: itemDelegate.foregroundColor
                                    text: date+': '+time+(!taskID ? '' : ': #' + taskID)
                                }
                                Text {
                                    color: itemDelegate.foregroundColor
                                    text: 'Title: ' + taskTitle
                                }
                            }
                            ToolSeparator{}
                            Column {
                                Layout.fillWidth: true
                                Text {
                                    color: itemDelegate.foregroundColor
                                    text: comment
                                    anchors.fill: parent
                                }
                            }
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onDoubleClicked: activityLogPage.openInBrowser(index, taskID, listModel.get(index))
                        onClicked: {
                            listView.currentIndex = index
                            var currentItem = listModel.get(index)
                            activityLogPage.select(index, taskID, currentItem)
                        }
                        onPressAndHold: {
                            contextMenu.popup()
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        acceptedButtons: Qt.RightButton | Qt.TapAndHoldGesture
                        onClicked: {
                            contextMenu.popup()
                        }
                    }
                    Menu {
                        id: contextMenu
                        MenuItem {
                            text: "Open in Browser"
                            onTriggered: activityLogPage.openInBrowser(index, taskID, listModel.get(index))
                        }
                    }
                }
            }
            model: listModel
        }
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
