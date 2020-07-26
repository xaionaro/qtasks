import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Page {
    id: findTaskForm
    objectName: "findTaskForm"
    background: Rectangle{
        anchors.fill: parent
        color: palette.base
    }

    signal select(int index, string taskID, QtObject item)
    onSelect: backend.findTaskSelect(index, taskID, item)

    signal updateFilter(string pattern)
    onUpdateFilter: backend.findTaskUpdateFilter(pattern)

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        TextField {
            id: filterField
            Layout.fillWidth: true
            Layout.fillHeight: false
            selectByMouse: true
            persistentSelection: true
            placeholderText: qsTr("Filter")
            onTextChanged: findTaskForm.updateFilter(filterField.text)
        }

        TasksListView{
            modelEnableOther: false
            Layout.fillHeight: true
            Layout.fillWidth: true
            onSelect: {
                stackView.pop()
                console.log(index, taskID, item)
                findTaskForm.select(index, taskID, item)
            }
        }
    }

    Component.onCompleted: {
        filterField.focus=true
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2;anchors_height:100;anchors_width:100}
}
##^##*/
