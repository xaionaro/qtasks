import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3

Rectangle {
    id: tasksPage
    objectName: "tasksPage"
    property var title: qsTr("tasks")

    signal logOnce(int index, string taskID, Item item, string since, string until, string comment)
    signal setComment(int index, string taskID, Item item, string comment)
    signal sendComment(int index, string taskID, Item item, string comment)
    signal startContinuousTimeTracking(int index, string taskID, Item item, string comment)
    signal stopContinuousTimeTracking()

    onLogOnce: backend.logOnce(index, taskID, item, since, until, comment)
    onSetComment: backend.setComment(index, taskID, item, comment)
    onSendComment: backend.sendComment(index, taskID, item, comment)
    onStartContinuousTimeTracking: backend.startContinuousTimeTracking(index, taskID, item, comment)
    onStopContinuousTimeTracking: backend.stopContinuousTimeTracking()

    ColumnLayout {
        id: tasksLayout
        anchors.fill: parent

        TasksListView {
            id: taskList
            Component.onCompleted: {
                taskList.selectDefault()
            }
            onSelect: {
                if (startButton.checked) {
                    tasksPage.stopContinuousTimeTracking()
                    tasksPage.startContinuousTimeTracking(taskList.currentIndex, taskList.currentTaskID, taskList.currentItem, commentTextArea.text)
                }
            }
        }

        Column {
            id: controls
            Layout.fillWidth: true

            RowLayout {
                id: logOnceLayout
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right

                Button {
                    id: findTaskButton
                    text: qsTr("&Find task")
                    font.bold: false
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    onClicked: {
                        stackView.push("FindTaskForm.qml")
                    }
                }

                Shortcut {
                    sequence: StandardKey.Find
                    context: Qt.ApplicationShortcut
                    onActivated: findTaskButton.clicked()
                }

                Button {
                    id: createTaskButton
                    text: qsTr("&Create task")
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    onClicked: {
                        stackView.push("CreateTaskForm.qml")
                    }
                }

                Shortcut {
                    sequence: StandardKey.Copy
                    context: Qt.ApplicationShortcut
                    onActivated: createTaskButton.clicked()
                }

                Item {
                    height: logOnceDetailsLayout.height
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                ColumnLayout {
                    id: logOnceDetailsLayout
                    Layout.alignment: Qt.AlignRight | Qt.AlignBottom

                    DateTimePicker {
                        id: logOnceSinceDateTime
                        onValueChanged: {
                            if (logOnceSinceDateTime.value > logOnceUntilDateTime.value) {
                                logOnceUntilDateTime.value = logOnceSinceDateTime.value
                            }
                        }
                    }

                    DateTimePicker {
                        id: logOnceUntilDateTime
                        onValueChanged: {
                            if (logOnceUntilDateTime.value < logOnceSinceDateTime.value) {
                                logOnceSinceDateTime.value = logOnceUntilDateTime.value
                            }
                        }
                    }
                }

                Button {
                    id: logOnceButton
                    text: qsTr("Log once")
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignRight | Qt.AlignBottom
                    onClicked: {
                        if (taskList.selectedIdx < 0) {
                            taskList.selectDefault()
                        }
                        tasksPage.logOnce(taskList.currentIndex, taskList.currentTaskID, taskList.currentItem, logOnceSinceDateTime.value, logOnceUntilDateTime.value, commentTextArea.text)
                    }
                }

                RowLayout {
                    id: commentControlsLayout
                    Layout.alignment: Qt.AlignRight | Qt.AlignBottom
                    visible: false

                    Button {
                        id: setCommentButton
                        text: qsTr("S&et comment")
                        onClicked: {
                            if (taskList.selectedIdx < 0) {
                                taskList.selectDefault()
                            }
                            commentTextArea.focus = false
                            tasksPage.setComment(taskList.currentIndex, taskList.currentTaskID, taskList.currentItem, commentTextArea.text)
                        }
                    }

                    Button {
                        id: sendCommentButton
                        text: qsTr("&Send comment")
                        onClicked: {
                            if (taskList.selectedIdx < 0) {
                                taskList.selectDefault()
                            }
                            tasksPage.sendComment(taskList.currentIndex, taskList.currentTaskID, taskList.currentItem, commentTextArea.text)
                            commentTextArea.clear()
                        }
                    }
                }
            }

            RowLayout {
                id: continouslyTrackLayout
                anchors.right: parent.right
                anchors.left: parent.left

                Button {
                    id: startButton
                    height: commentTextArea.height
                    text: qsTr("Continously track time...")
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    checkable: true
                    onCheckedChanged: {
                        if(checked) {
                            if (taskList.selectedIdx < 0) {
                                taskList.selectDefault()
                            }
                            tasksPage.startContinuousTimeTracking(taskList.currentIndex, taskList.currentTaskID, taskList.currentItem, commentTextArea.text)
                        } else {
                            tasksPage.stopContinuousTimeTracking()
                        }
                    }
                }

                TextArea {
                    id: commentTextArea
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    placeholderText: qsTr("Comment")
                    background: Rectangle {
                        border.color: "#21be2b"
                    }
                    onFocusChanged: {
                        commentControlsLayout.visible = focus
                        logOnceDetailsLayout.visible = !focus
                        logOnceButton.visible = !focus
                    }
                    Keys.onEscapePressed: {
                        focus = false
                    }
                }
            }
        }
    }

    onFocusChanged: {
        if (focus) {
            commentTextArea.forceActiveFocus()
        }
    }
    Component.onCompleted: {
        commentTextArea.forceActiveFocus()
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

