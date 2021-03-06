import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Page {
    id: createTaskForm
    objectName: "createTaskForm"

    signal createTask(string title, string summary)
    onCreateTask: backend.taskCreate(title, summary)

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        TextField {
            id: titleField
            Layout.fillWidth: true
            focus: true
            selectByMouse: true
            persistentSelection: true
            placeholderText: qsTr("Title")
            onAccepted: {
                createButton.clicked()
            }
        }

        TextArea {
            id: summaryField
            Layout.fillWidth: true
            Layout.fillHeight: true
            placeholderText: qsTr("Summary...")
            selectByMouse: true
            persistentSelection: true
            background: Rectangle {
                color: palette.base
                border.color: parent.activeFocus ? palette.highlight : palette.alternateBase
            }
        }

        RowLayout {
            id: controls
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            Layout.fillWidth: true

            Button {
                id: cancelButton
                text: qsTr("C&ancel")
                Layout.fillWidth: true
                onClicked: {
                    stackView.pop()
                }
            }

            Button {
                id: createButton
                text: qsTr("&Create")
                Layout.fillWidth: true
                onClicked: {
                    createTaskForm.createTask(titleField.text, summaryField.text)
                    stackView.pop()
                }
            }
        }
    }

    Component.onCompleted: {
        focus=true
        titleField.focus = true
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
