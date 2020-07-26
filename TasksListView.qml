import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

GridLayout {
    id: layout

    signal select(int index, string taskID, QtObject item)
    signal openInBrowser(int index, string taskID, QtObject item)
    signal remove(int index, string taskID, QtObject item)
    signal close(int index, string taskID, QtObject item)

    onSelect: backend.taskSelect(index, taskID, item)
    onOpenInBrowser: backend.taskOpenInBrowser(index, taskID, item)
    onRemove: backend.taskRemove(index, taskID, item)
    onClose: backend.taskClose(index, taskID, item)

    property var modelEnableOther: true
    property alias model: taskModel

    ListModel {
        id: taskModel
        Component.onCompleted: {
            if(APPEND_WITH_SAMPLE_VALUES) {
                taskModel.append({
                                 taskID: "123",
                                 title: "some title",
                                 summary: "some summary",
                                 isDefault: false,
                             })
            }
            if(layout.modelEnableOther) {
                taskModel.append({ taskID: "", title: "Other", summary: "", isDefault: true })
            }
        }

    }

    property alias currentIndex: listView.currentIndex
    property var currentTaskID: listView.currentIndex >= 0 ? taskModel.get(listView.currentIndex).taskID : null

    property var backgroundColorInactive0: palette.base
    property var backgroundColorInactive1: palette.alternateBase
    property var foregroundColorInactive: palette.text
    property var backgroundColorActive: palette.highlight
    property var foregroundColorActive: palette.highlightedText
    property var backgroundColorContext: palette.toolTipBase
    property var foregroundColorContext: palette.toolTipText
    property alias listView: listView

    function selectDefault() {
        var idx = 0;
        while(true) {
            var child = taskModel.get(idx);
            if (!child) {
                break;
            }
            if (child.isDefault) {
                layout.currentIndex = idx;
                break;
            }
            idx++;
        }
    }

    ListView {
        id: listView
        focus: true
        currentIndex: -1
        Layout.fillWidth: true
        Layout.fillHeight: true
        delegate: Component {
            Item {
                id: itemDelegate
                property var backgroundColorDefault: index % 2 == 0 ? layout.backgroundColorInactive0 : layout.backgroundColorInactive1
                property var backgroundColor: contextMenu.opened ? layout.backgroundColorContext : backgroundColorDefault
                property var foregroundColorDefault: listView.currentIndex == index ? layout.foregroundColorActive : layout.foregroundColorInactive
                property var foregroundColor: contextMenu.opened ? layout.foregroundColorContext : foregroundColorDefault


                height: font.pixelSize*2.6
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                Rectangle {
                    anchors.fill: parent
                    color: listView.currentIndex == index ? layout.backgroundColorActive : itemDelegate.backgroundColor
                    border.color: listView.currentIndex == index ? layout.backgroundColorActive : layout.backgroundColorInactive1
                }
                Column {
                    Text {
                        color: itemDelegate.foregroundColor
                        text: !taskID ? ' ' : '#' + taskID
                    }
                    Text {
                        color: itemDelegate.foregroundColor
                        text: 'Title: ' + title
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onDoubleClicked: layout.openInBrowser(index, taskID, currentItem)
                    onClicked: {
                        listView.currentIndex = index
                        var currentItem = taskModel.get(index)
                        console.log(index, taskID, currentItem)
                        layout.select(index, taskID, currentItem)
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
                        enabled: taskID != ""
                        text: "Open in Browser"
                        onClicked: {
                            var currentItem = taskModel.get(index)
                            layout.openInBrowser(index, taskID, currentItem)
                        }
                    }
                    MenuItem {
                        enabled: taskID != ""
                        text: "Remove from this list"
                        onClicked: {
                            taskModel.remove(index)
                            var currentItem = taskModel.get(index)
                            layout.remove(index, taskID, currentItem)
                        }
                    }
                    MenuItem {
                        enabled: taskID != ""
                        text: "Status to \"Closed\""
                        onClicked: {
                            taskModel.remove(index)
                            var currentItem = taskModel.get(index)
                            layout.close(index, taskID, currentItem)
                        }
                    }
                }
            }
        }
        model: taskModel
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
