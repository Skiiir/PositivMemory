import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."

import io.qt.MoodApp.memory 1.0

//I'm not sure whats exactly is happing here. But with save buttom you should sava all fields in Data
//At least "title,art,text" should be working. ^^
//so no comments down here sorry, but perhaps in RequestInput
ApplicationWindow {
    id: window

    visible: true
    width: 1029
    height: 1920
    Memory {
        id: memory
    }

    Flickable{
        Button {
            id: toolButton
            x: 0
            y: 0
            text: "back"

            // font.family: "Times New Roman"
            //  font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                //      stackView.get("RequestInput.qml")
                stackView.push("RequestInput.qml")

                window.close()

                //drawer.close()

            }
        }


        ScrollView {
            clip: true


               ScrollBar.vertical.policy: ScrollBar.AlwaysOn
            //ScrollBar.horizontal.active: true
            //ScrollBar.horizontal.interactive: true
            //ScrollBar.vertical.interactive: true

            x: 0
            y: 31

            width: 1020
            height: 1578

            ScrollBar {
                height: 20
                width: 0
                id: vbar
                hoverEnabled: true
                active: hovered || pressed
                orientation: Qt.Vertical
                //size: frame.height / content.height
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom



                //   contentChildren: ownPartText
                //contentData: list<titleTexttest>

                TextArea {
                    id: titleText

                    //       y:40
                    x:0
                    y: 44

                    width: 1020
                    height: 200
                    // text: qsTr("\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt")
                    placeholderText: qsTr("Title des Vibes")

                    //   font.family : "Helvetica"
                    font.pixelSize: 50
                    onTextChanged: {
                        memory.title = text;
                    }
                }

                TextArea {
                    id: artText

                    y:259
                    x:0

                    width: 1020
                    height: 200
                    //text: qsTr("\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt\nte\nxt")
                    font.pixelSize: 50
                    placeholderText: qsTr("welcher art ")
                    onTextChanged: {
                        memory.art = text;
                    }
                }

                TextArea {
                    id: textText
                    x: 0
                    y: 473
                    width: 1020
                    height: 400
                    text: textText.text
                    Keys.enabled: false
                    Keys.onReturnPressed: console.log("Return key was pressed")
                    //objectName: "rect"
                    //   z: 1
                    font.pixelSize: 50
                    placeholderText: qsTr("Was hast du erlebt?")
                    //     anchors.centerIn: parent
                    onTextChanged: {
                        memory.text = text;
                    }
                }

                TextArea {
                    id: intensityText
                    x: 0
                    y: 914
                    width: 1020
                    height: 200
                    placeholderText: qsTr("Wie gut war der Vibe?")
                    font.pixelSize: 50
                    onTextChanged: {
                        memory.intensity = text;
                    }
                }

                TextArea {
                    id: ownPartText
                    x: 0
                    y: 1132
                    width: 1020
                    height: 200
                    placeholderText: qsTr("Was war das beste oder \n was hast  du vielleicht dabei gut gemacht ?")

                    font.pixelSize: 50
                    onTextChanged: {
                        memory.ownPart = text;
                    }
                }


                        Button {
                        id: saveToolButtom
                       // x: 390
                       // y: 1320
                        x:300
                        y: 1449
                        width: 456
                        height: 102
                        text: "Speichern"
                        //font.family: "Times New Roman"
                        //font.pixelSize: Qt.application.font.pixelSize * 1.6
                        onClicked: {
                            memory.save = "text";
                        }
                 }

                }
                }

    }

    StackView {
        id: stackView
        width: 1020
        visible: true
        anchors.bottomMargin: -241
        anchors.fill : parent
              //    initialItem: "RequestInput.qml"
                //  initialItem: "HomeForm.ui.qml"
               //   anchors.fill: parent
           }
    }








/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
