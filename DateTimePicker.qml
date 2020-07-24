import QtQuick 2.4
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Page {
    id: dateTimePicker

    property var value: null
    property var daysInMonth: 32
    property alias timeTextField: timeTextField
    property alias dateTextField: dateTextField

    ColumnLayout {
        id: dateTimePickerLayout

        function onChanged() {
            if (!dateTimePickerLayout.completed) {
                return
            }
            var date = dateTextField.text.split("-")
            var time = timeTextField.text.split(":")
            var dateTime = new Date(
                        parseInt(date[0]), parseInt(date[1])-1, parseInt(date[2]),
                        parseInt(time[0]), parseInt(time[1]), parseInt(time[2])
                        )
            if (isNaN(dateTime)) {
                console.log("NaN date")
                return
            }
            if (dateTimePicker.value == null || dateTimePicker.value.getTime() !== dateTime.getTime()) {
                dateTimePicker.value = dateTime
            }
        }

        property var completed: false
        Component.onCompleted: {
            dateTimePickerLayout.completed = true
            dateTimePickerLayout.onChanged()
        }

        RowLayout {
            id: datePickerLayout
            visible: dateTextField.focus && dateTimePicker.focus


            FontMetrics {
                id: fontMetrics
            }

            Tumbler {
                id: yearTumbler
                model: [
                    2020,
                    2021,
                    2022,
                    2023,
                    2024,
                    2025,
                    2026,
                    2027,
                    2028,
                    2029,
                ]
                onCurrentIndexChanged: {
                    var value = dateTextField.text.split("-")
                    value[0] = String(currentIndex+2020).padStart(4, '0')
                    dateTextField.text = value.join("-")
                    dateTimePicker.daysInMonth = (new Date(parseInt(dateTextField.text.split("-")[0]), parseInt(dateTextField.text.split("-")[1]), 0)).getDate()
                }
            }

            Component {
                id: delegateMonthComponent

                Label {
                    property var monthName: [
                        "Jan",
                        "Feb",
                        "Mar",
                        "Apr",
                        "May",
                        "Jun",
                        "Jul",
                        "Aug",
                        "Sep",
                        "Oct",
                        "Nov",
                        "Dec",
                    ]
                    text: (modelData+1)+" - "+monthName[modelData]
                    opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: fontMetrics.font.pixelSize
                }
            }

            Tumbler {
                id: monthTumbler
                model: 12
                delegate: delegateMonthComponent
                onCurrentIndexChanged: {
                    var value = dateTextField.text.split("-")
                    value[1] = String(currentIndex+1).padStart(2, '0')
                    dateTextField.text = value.join("-")
                    dateTimePicker.daysInMonth = (new Date(parseInt(dateTextField.text.split("-")[0]), parseInt(dateTextField.text.split("-")[1]), 0)).getDate()
                }
            }

            Component {
                id: delegateDayComponent
                Label {
                    text: String(modelData+1).padStart(2, '0')
                    opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: fontMetrics.font.pixelSize
                }
            }

            Tumbler {
                id: dayTumbler
                model: dateTimePicker.daysInMonth
                delegate: delegateDayComponent
                onCurrentIndexChanged: {
                    var value = dateTextField.text.split("-")
                    value[2] = String(currentIndex+1).padStart(2, '0')
                    dateTextField.text = value.join("-")
                }
            }

            Button {
                id: dateSetButton
                text: qsTr("SET")
                Layout.maximumWidth: font.pixelSize * 4
                Layout.fillHeight: true
            }
        }

        RowLayout {
            id: timePickerLayout
            visible: timeTextField.focus && dateTimePicker.focus

            Component {
                id: delegateZeroPadded2DigitsComponent
                Label {
                    text: String(modelData).padStart(2, '0')
                    opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: fontMetrics.font.pixelSize
                }
            }

            Tumbler {
                id: hoursTumbler
                model: 24
                delegate: delegateZeroPadded2DigitsComponent
                onCurrentIndexChanged: {
                    var value = timeTextField.text.split(":")
                    value[0] = String(currentIndex).padStart(2, '0')
                    timeTextField.text = value.join(":")
                }
            }

            Tumbler {
                id: minutesTumbler
                model: 60
                delegate: delegateZeroPadded2DigitsComponent
                onCurrentIndexChanged: {
                    var value = timeTextField.text.split(":")
                    value[1] = String(currentIndex).padStart(2, '0')
                    timeTextField.text = value.join(":")
                }
            }

            Tumbler {
                id: secondsTumbler
                model: 60
                delegate: delegateZeroPadded2DigitsComponent
                onCurrentIndexChanged: {
                    var value = timeTextField.text.split(":")
                    value[2] = String(currentIndex).padStart(2, '0')
                    timeTextField.text = value.join(":")
                }
            }

            Button {
                id: timeSetButton
                text: qsTr("SET")
                Layout.maximumWidth: font.pixelSize * 4
                Layout.fillHeight: true
            }

            Component.onCompleted: {
                dateTimePicker.daysInMonth = (new Date(parseInt(dateTextField.text.split("-")[0]), parseInt(dateTextField.text.split("-")[1]), 0)).getDate()
            }
        }

        RowLayout {
            id: textFieldsLayout

            TextField {
                id: dateTextField
                placeholderText: qsTr("2006-01-02")
                inputMask: "9999-09-09"
                inputMethodHints: Qt.ImhDate | Qt.ImhNoPredictiveText | Qt.ImhDigitsOnly
                onFocusChanged: {
                    var value = text.split("-")
                    yearTumbler.currentIndex = parseInt(value[0]) - 1
                    monthTumbler.currentIndex = parseInt(value[1]) - 1
                    dayTumbler.currentIndex = parseInt(value[2]) - 1
                }
                onAccepted: {
                    focus = false
                }
                onTextChanged: {
                    dateTimePickerLayout.onChanged()
                }
            }

            TextField {
                id: timeTextField
                placeholderText: qsTr("15:04:05")
                inputMask: "09:09:09"
                inputMethodHints: Qt.ImhTime | Qt.ImhNoPredictiveText | Qt.ImhDigitsOnly
                onFocusChanged: {
                    var value = text.split(":")
                    hoursTumbler.currentIndex = Math.min(hoursTumbler.model-1, value[0])
                    minutesTumbler.currentIndex = Math.min(minutesTumbler.model-1, value[1])
                    secondsTumbler.currentIndex = Math.min(secondsTumbler.model-1, value[2])
                }
                onAccepted: {
                    focus = false
                }
                onTextChanged: {
                    dateTimePickerLayout.onChanged()
                }
            }
        }
    }
    onValueChanged: {
        var dateString = value.getFullYear() + "-" +  String((value.getMonth() + 1)).padStart(2, '0') + "-" +  String((value.getDate())).padStart(2, '0')
        if (dateTextField.text !== dateString) {
            console.log(dateTextField.text, dateString)
            dateTextField.text = dateString
        }
        var timeString = value.getFullYear() + "-" +  String((value.getMonth() + 1)).padStart(2, '0') + "-" +  String((value.getDate())).padStart(2, '0')
        if (dateTextField.text !== dateString) {
            console.log(dateTextField.text, dateString)
            dateTextField.text = dateString
        }
    }
    onFocusChanged: {
        console.log("wfocus", focus)
        if (focus === false){
            dateTextField.focus = false
            timeTextField.focus = false
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:300;width:300}
}
##^##*/
