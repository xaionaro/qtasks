import QtQuick 2.14
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3

Rectangle {
    id: notesPage
    objectName: "notesPage"

    property var title: qsTr("notes")

    signal select(QtObject item)
    signal saveToFile(QtObject item)
    signal renderToFile(QtObject item)
    signal update(QtObject item)
    signal add(int index, QtObject item)
    signal remove(QtObject item)

    onSelect: backend.noteSelect(item)
    onSaveToFile: backend.noteSaveToFile(item)
    onRenderToFile: backend.noteRenderToFile(item)
    onUpdate: backend.noteUpdate(item)
    onAdd: backend.noteAdd(index, item)
    onRemove: backend.noteRemove(item)

    ListModel {
        id: listModel
        onDataChanged: {
            if (topLeft !== bottomRight) {
                console.exception("more than one item was modified, do not know how to process this case")
            }

            notesPage.update(get(topLeft).row)
        }
        onRowsInserted: {
            for (var i = first; i <= last; i++) {
                var itemToAdd = listModel.get(i)
                notesPage.add(i, itemToAdd)
            }
        }
        onRowsAboutToBeRemoved: {
            for (var i = first; i <= last; i++) {
                var itemToRemove = listModel.get(i)
                notesPage.remove(itemToRemove)
            }
        }
        Component.onCompleted: {
            if(APPEND_WITH_SAMPLE_VALUES) {
                listModel.append({
                                 noteID: "123",
                                 createUnixtime: 1595582887,
                                 updateUnixtime: 1595582905,
                                 title: "note title",
                                 content: "\n... some content ...\n",
                                 cursorPosition: 2,
                             })
                listModel.append({
                                 noteID: "124",
                                 createUnixtime: 1595583900,
                                 updateUnixtime: 1595583905,
                                 title: "another title",
                                 content: "\n... another content ...\n",
                                 cursorPosition: 3,
                             })
            }
        }
    }

    property var backgroundColorInactive0: "#EEEEEE"
    property var backgroundColorInactive1: "#FFFFFF"
    property var foregroundColorInactive: "#000000"
    property var backgroundColorActive: "#00FF00"
    property var foregroundColorActive: "#000000"
    property var backgroundColorContext: "#80FF80"
    property var foregroundColorContext: "#000000"

    RowLayout {
        id: rowLayout
        anchors.fill: parent

        ColumnLayout {
            id: columnLayout
            Layout.maximumWidth: 100

            TextField {
                id: filterField
                Layout.fillWidth: true
                placeholderText: qsTr("filter")
            }

            ListView {
                id: listView
                currentIndex: -1
                property var previousCurrentIndex: -1
                Layout.fillHeight: true
                Layout.fillWidth: true
                delegate: Component {
                    id: component
                    Item {
                        id: itemDelegate

                        function startRenaming() {
                            nameField.forceActiveFocus()
                            nameField.selectAll()
                        }

                        property var backgroundColorDefault: index % 2 == 0 ? notesPage.backgroundColorInactive0 : notesPage.backgroundColorInactive1
                        property var backgroundColor: contextMenu.opened ? notesPage.backgroundColorContext : backgroundColorDefault
                        property var foregroundColorDefault: notesPage.foregroundColorInactive
                        property var foregroundColor: contextMenu.opened ? notesPage.foregroundColorContext : foregroundColorDefault

                        visible: title.search(filterField.text) >=0 || filterField.text == ""
                        height: (title.search(filterField.text) >=0 || filterField.text == "") ? nameField.height : 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        Rectangle {
                            anchors.fill: parent
                            color: listView.currentIndex == index ? notesPage.backgroundColorActive : itemDelegate.backgroundColor
                        }
                        TextField {
                            id: nameField
                            background: Rectangle {
                                anchors.fill: parent
                                color: "transparent"
                            }
                            onAccepted: {
                                var isUnnamed = listModel.get(index).isUnnamed
                                if (typeof isUnnamed !== 'undefined' && isUnnamed) {
                                    listView.currentIndex = index
                                    listModel.setProperty(index, "isUnnamed", false)
                                }
                                textArea.forceActiveFocus()
                            }
                            onTextChanged: {
                                listModel.setProperty(index, "title", nameField.text)
                                nameField.text = title
                            }

                            color: itemDelegate.foregroundColor
                            text: title

                            Component.onCompleted: {
                                var isUnnamed = listModel.get(index).isUnnamed
                                if (typeof isUnnamed !== 'undefined' && isUnnamed) {
                                    itemDelegate.startRenaming()
                                }
                            }
                        }
                        MouseArea {
                            id: mouseAreaLeftClick
                            anchors.fill: parent
                            enabled: !nameField.focus
                            onDoubleClicked: {
                                nameField.forceActiveFocus()
                            }
                            onClicked: {
                                listView.currentIndex = index
                            }
                            onPressAndHold: {
                                contextMenu.popup()
                            }
                        }
                        MouseArea {
                            id: mouseAreaRightClick
                            anchors.fill: parent
                            enabled: !nameField.focus
                            acceptedButtons: Qt.RightButton | Qt.TapAndHoldGesture
                            onClicked: {
                                contextMenu.popup()
                            }
                        }
                        Menu {
                            id: contextMenu
                            MenuItem {
                                text: "Save to file"
                                onTriggered: {
                                    var currentItem = listModel.get(listView.currentIndex)
                                    notesPage.saveToFile(currentItem)
                                }
                            }
                            MenuItem {
                                text: "Render to file"
                                onTriggered: {
                                    var currentItem = listModel.get(listView.currentIndex)
                                    notesPage.renderToFile(currentItem)
                                }
                            }
                            MenuItem {
                                text: "Rename"
                                onTriggered: {
                                    itemDelegate.startRenaming()
                                }
                            }
                            MenuItem {
                                text: "Remove"
                                onTriggered: {
                                    confirmRemoveDialog.indexToRemove = index
                                    confirmRemoveDialog.open()
                                }
                            }
                        }
                    }
                }
                model: listModel                
                onCurrentIndexChanged: {
                    if (listView.previousCurrentIndex >= 0) {
                        listModel.setProperty(listView.previousCurrentIndex, "cursorPosition", textArea.cursorPosition)
                    }
                    if (listView.currentIndex >= 0) {
                        var currentItem = listModel.get(listView.currentIndex)
                        notesPage.select(currentItem)
                        textArea.text = currentItem.content
                        textArea.cursorPosition = currentItem.cursorPosition
                    }
                    listView.previousCurrentIndex = listView.currentIndex
                }
            }

            Button {
                id: addNoteButton
                text: qsTr("&ADD")
                Layout.fillWidth: true
                onClicked: {
                    listModel.append({
                                         isUnnamed: true,
                                         createUnixtime: Math.floor(Date.now() / 1000),
                                         updateUnixtime: Math.floor(Date.now() / 1000),
                                         title: "unnamed",
                                         content: "",
                                         cursorPosition: 0,
                                     })
                }
            }

            Shortcut {
                sequence: "Alt+UP"
                context: Qt.ApplicationShortcut
                onActivated: listView.decrementCurrentIndex()
            }
            Shortcut {
                sequence: "Alt+DOWN"
                context: Qt.ApplicationShortcut
                onActivated: listView.incrementCurrentIndex()
            }
        }

        TextArea {
            id: textArea
            visible: listView.currentIndex >= 0
            Layout.fillHeight: true
            Layout.fillWidth: true
            placeholderText: qsTr("write the note here...")
            onTextChanged: {
                if (listView.currentIndex < 0) {
                    return
                }
                listModel.setProperty(listView.currentIndex, "content", textArea.text)
            }
        }

        ScrollView {
            id: scrollView
            visible: listView.currentIndex >= 0
            width: 200
            height: 200
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    MessageDialog {
        id: confirmRemoveDialog
        property var indexToRemove: null
        title: "Confirm the removal"
        text: "Do you confirm you want to remove the item?"
        visible: false
        standardButtons: StandardButton.Ok | StandardButton.Cancel
        onAccepted: {
            listModel.remove(confirmRemoveDialog.indexToRemove)
            confirmRemoveDialog.indexToRemove = null
            confirmRemoveDialog.close()
        }
    }

    onFocusChanged: {
        if (focus) {
            textArea.forceActiveFocus()
        }
    }
    Component.onCompleted: {
        textArea.forceActiveFocus()
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
