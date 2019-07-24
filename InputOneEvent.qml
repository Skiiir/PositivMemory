import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4
import io.qt.MoodApp.memory 1.0
import io.qt.MoodApp.engine 1.0
//I'm not sure whats exactly is happing here. But with save buttom you should sava all fields in Data
//At least "title,art,text" should be working. ^^
//so no comments down here sorry, but perhaps in RequestInput
// #f0e68c = khaki
ApplicationWindow {
    background: color = bs.pageTypeColor()
    id: window

BasicStructure {
    id: bs
  //

   pageType: 0

    titleText:"One Event"




}
Engine {
    id: engine
    displayWidth : 1
   displayHeight : 1
  //  file: ""
}
       width: engine.displayWidth
       height: engine.displayHeight

    onClosing: {

       // stackView.push("RequestMenu.qml")
        close.accepted = true

        //window.close()
    }





    visible: true
    Memory {
        id: memory


    }
    StackView {
        id: stackView
        width: window.width
        height: window.height

        visible: true
        initialItem: Page {
            height: availableHeight
            background: color = "#85DCB0"



            ListView {



                id: listView


                y: bs.titleHeight
                width:engine.displayWidth
                height: engine.displayHeight  - bs.menuHeight


                footer: {
                    height : bs.menuHeight
                }

                delegate: Item {

                    x: 0
                    y:0
                    width: engine.displayWidth
                    height: saveRow.y + saveToolButtom.height + listView.y

                    Row {
                        id: titleRow
                        y:10
                        x:(engine.displayWidth-titleText.width)/2
                        TextInputLines {


                            y:0
                            text:  engine.file



                            placeholderText: "title"

                            onTextChanged: {
                                memory.title = text;
                            }
                            id: titleText
                        }



                    }
                    Row {
                        id: artRow
                        y:20 + titleText.height
                        x: (engine.displayWidth - titleText.width)/2

                        ComboBox
                        {

                            model: ["Familie","Freunde","Hobby","School"]


                            currentIndex: -1

                            displayText:  currentIndex === -1  ? "Category" : currentText

                            id: artBox
                            x:4
                            y:0
                            width: titleText.width
                            height: titleText.height



                            pressed: memory.art = currentText
                            background: BackgroundRectangle {
                            color: "#000000"
                            }

                            //Component.onCompleted: {


                            font.pixelSize: titleText.height / 3






                        }
                    }

                    Row {
                        id: textRow
                        y: 30 + titleText.height + artBox.height
                        x: (engine.displayWidth - titleText.width)/2


                        TextInputLines {

                            id: textText
                            height: titleText.height *5

                            placeholderText: "Good experience"
                            onTextChanged: {
                                memory.text = text;
                            }

                            TextArea {
                                x: engine.displayWidth / 2 - width / 2
                                y: textRow.height  / 2  - height /2
                                background: Rectangle {
                                    color: "#C38D9E"
                                    border.color: "#000000"
                                    border.width: 3
                                    radius: 20
                                }

                                visible: timerforSavePopUp.running? true : false

                                //textMargin: 4
                                width: implicitWidth * 1.5
                                readOnly: true

                                font.hintingPreference: Font.PreferVerticalHinting
                                color: "#E27D60"
                                placeholderTextColor : color
                                wrapMode: TextEdit.WordWrap
                                font.pixelSize:  availableHeight / 30
                                height:  availableHeight / 10
                                textMargin: (width - implicitWidth) /2


                                id: savePopUpText

                                text: "Save"

                            }





                        }



                    }
                    Row {
                        id: intensityRow
                        y: 40 + titleText.height + artBox.height + textText.height
                        x: (engine.displayWidth - titleText.width)/2
                        TextInputLines {

                            id: intensityText
                            placeholderText: "Can you give it a number?"
                            onTextChanged: {
                                memory.intensity = text;
                            }
                        }
                    }
                    Row {
                        id: ownPartRow
                        y: 50 + intensityText.height + titleText.height + artBox.height + textText.height

                        x: (engine.displayWidth - titleText.width)/2
                        TextInputLines {
                            id: ownPartText
                            placeholderText: "best Part?"
                            onTextChanged: {
                                memory.ownPart = text;
                            }
                        }
                    }
                    Row {
                        id: saveRow
                        y: 60 + ownPartText.height + intensityText.height + titleText.height + artBox.height + textText.height
                        x: (window.width - saveToolButtom.width)/2

                        Button {
                            id: saveToolButtom
                            x: 0
                            y: 0

                            width: window.width / 3
                            height:   window.height /10
                            background: Rectangle {

                                color: bs.outputColor
                                border.color: "#00FFFF"
                                border.width: 4


                                radius: 50
                            }


                            contentItem: Text {
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                text: "Speichern"

                                color: "#E27D60"
                                font.pixelSize: window.height / 45
                            }


                            onClicked: {
                                memory.save = "text";
                                timerforSavePopUp.running = true
                            }

                        }



                    }
                }

                Timer{
                    id: timerforSavePopUp
                    interval: 1000
                    repeat: false
                    running: false
                    triggeredOnStart: false

                    onTriggered:
                    {
                        //loader_one.source = ""
                        //savePopUpText.visible = true;

                    }

                }


                model: ListModel {
                    ListElement {


                    }
                }
            }


        }
    }

}





