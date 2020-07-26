import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Calendar {
    id: calendar

    style: CalendarStyle {
        id: calendarStyle
        gridVisible: false
        dayDelegate: Rectangle {
            color: styleData.selected ? palette.highlight : (styleData.visibleMonth && styleData.valid ? palette.alternateBase : palette.base )

            Label {
                text: styleData.date.getDate()
                anchors.centerIn: parent
                color: styleData.selected ? palette.highlightedText : (styleData.visibleMonth && styleData.valid ? palette.text : "#7F7F7F" )
            }

            Rectangle {
                width: parent.width
                height: 1
                color: "#555"
                anchors.bottom: parent.bottom
            }

            Rectangle {
                width: 1
                height: parent.height
                color: "#555"
                anchors.right: parent.right
            }
        }

        dayOfWeekDelegate: Rectangle {
            color: palette.base
            height: 40
            Label {
                text: control.locale.dayName(styleData.dayOfWeek, control.dayOfWeekFormat)
                anchors.centerIn: parent
                color: palette.text
            }
        }

        weekNumberDelegate: Rectangle {
            color: palette.base
            Label {
                text: styleData.weekNumber
                anchors.centerIn: parent
                color: palette.text
            }
        }

        navigationBar: Rectangle {
            height: 41
            color: palette.base

            Rectangle {
                color: Qt.rgba(1,1,1,0.6)
                height: 1
                width: parent.width
            }

            Rectangle {
                anchors.bottom: parent.bottom
                height: 1
                width: parent.width
                color: "#ddd"
            }
            Button {
                id: previousMonth
                width: parent.height
                height: width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                style: ButtonStyle {
                    background: Rectangle {
                        anchors.fill: parent
                        border.width: control.activeFocus ? 2 : 1
                        border.color: palette.alternateBase
                        color: control.pressed ? palette.highlight : palette.base
                    }
                    label: Label {
                        color: control.hovered ? palette.highlightedText : palette.highlight
                        text: "\u2770"
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: control.height/2
                    }
                }
                onClicked: control.showPreviousMonth()
            }
            Label {
                id: dateText
                text: styleData.title
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                color: palette.text
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 14
            }
            Button {
                id: nextMonth
                width: parent.height
                height: width
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                style: ButtonStyle {
                    background: Rectangle {
                        anchors.fill: parent
                        border.width: control.activeFocus ? 2 : 1
                        border.color: palette.alternateBase
                        color: control.pressed ? palette.highlight : palette.base
                    }
                    label: Label {
                        color: control.hovered ? palette.highlightedText : palette.highlight
                        text: "\u2771"
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: control.height/2
                    }
                }
                onClicked: control.showNextMonth()
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
