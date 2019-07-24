import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.2
import "."
import io.qt.MoodApp.memory 1.0
import io.qt.MoodApp.memorylist 1.0
ApplicationWindow {
    id: window
    visible: true
    width: availableWidth
    height: availableHeight
    // title: qsTr("Stack")
    onClosing: {



        stackView.push("MainMenu.qml")
        close.accepted = true

        //window.close()
    }
    Memory {
        // memory Objekt

        // Keys.onReturnPressed: console.log("Return key was pressed")
        id: memory2
    }
    //MomoeryList Element. with "load...: " the QList<Memory> Attribute of this Object is getting load.
    MemoryList {
        id: memoryList1;
        load:""
    }
    //Buttom back
    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            x: 0
            y: 0
            text: "back"
            font.family: "Times New Roman"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                window.close()
                stackView.push("MainMenu.qml")
                drawer.close()

            }
        }

        Label {
            //   text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    //uper TextFeld
    Flickable {
        id: flickableItem
        focus: true
        ListView {
            id: listView
            x: 0
            y: 39
            width: 1029
            height: 1920
            delegate: Item {
                x: 5
                width: 1080
                height: rowAnswerOwnPart.y + rowAnswerOwnPart.height

                Row {
                    id: rowArtChoice


                    ComboBox {
                        width: 1020
                        height: 60
                        id: comboBox
                        model: ["Familie" , "Freunde", "Hobby", "School", "Reflektion"]

                        pressed: {
                            memoryList1.loadMemoryByArt = currentText
                            titleText.text = memoryList1.title
                            textText.text = memoryList1.text
                            ownPartText.text = memoryList1.ownPart
                        }
                    }

                }
                Row {
                    id: rowAnswerTitle
                    y: 10 + comboBox.height
                    TextArea {
                        id: titleText
                        wrapMode: TextEdit.WordWrap
                        height: text.implicitHeight
                        width: 1020
                        //text: "text:" + memoryList1.title
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                }
                Row {
                    id: rowAnswerText
                    y: 20 + titleText.height + comboBox.height
                    TextArea {
                        id: textText
                        wrapMode: TextEdit.WordWrap
                        height: text.implicitHeight
                        width: 1020
                        //text: "text:" + memoryList1.title
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                }
                Row {
                    id: rowAnswerOwnPart
                    y:30 + textText.height + titleText.height+ comboBox.height
                    TextArea {
                        id: ownPartText
                        wrapMode: TextEdit.WordWrap
                        height: text.implicitHeight
                        width: 1020
                        //text: "text:" + memoryList1.title
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                    }
                }
            }



            model: ListModel {
                ListElement {

                }


            }
        }

    }
}


