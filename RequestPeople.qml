import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4
import io.qt.MoodApp.memory 1.0

//I'm not sure whats exactly is happing here. But with save buttom you should sava all fields in Data
//At least "title,art,text" should be working. ^^
//so no comments down here sorry, but perhaps in RequestInput
// #f0e68c = khaki
ApplicationWindow {
    background: color = "#FFAEFD"
    id: window


    visible: true
    width: availableWidth
    height: availableHeight
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

            background: color = "#FFAEFD"
            header: ToolBar {
                width: availableWidth
                height: toolButton.height
                background: Rectangle {


                    color: "#006400"//control.enabled ? "#C5FF72" : "transparent"
                }
                Button {
                    id: toolButton
                    x: 0
                    y: 0
                    width: 120
                    height:   window.height /30
                    background: Rectangle {

                        color: "#8b008b"
                        border.color: "#fff"
                        border.width: 1


                        radius: 5
                    }
                    //  Text {

                    contentItem: Text {
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        text: "back"

                        color: "#000000"
                        font.pixelSize: window.height / 60
                    }


                    onClicked: {
                        stackView.push("MainMenu.qml")

                        window.close()
                    }
                }
            }


            ListView {


                id: listView

                x: 0
                y: 0
                width: availableWidth
                height: window.height
                delegate: Item {
                    x: 0
                    y:0
                    width: 1080
                    height: 1800
                    Row {
                        id: titleRow
                        y:10
                        x: (availableWidth - titleText.width)/2
                        TextArea {
                            x:0
                            y:0

                            background: Rectangle {
                                color: "#9acd32"
                                border.color: "#fff"
                                border.width: 3
                                radius: 10
                            }

                            textMargin: 4

                            width: availableWidth - 30
                            height: availableHeight / 30 + availableHeight / 15
                            font.hintingPreference: Font.PreferVerticalHinting
                            color: "#fff"
                            placeholderTextColor : color
                            wrapMode: TextEdit.WordWrap
                            font.pixelSize: availableHeight / 30



                            placeholderText: "Title des Vibes"
                            onTextChanged: {
                                memory.title = text;
                            }
                            id: titleText
                        }



                    }
                    Row {
                        id: artRow
                        y:20 + titleText.height
                        x: (availableWidth - titleText.width)/2
                        ComboBox {
                            model: ["Familie" , "Freunde", "Hobby", "School"]//, "Reflektion"
                            currentIndex: -1
                            displayText: currentIndex === -1 ? "Choose an art" : currentText
                            id: artBox
                            x:4
                            y:0
                            width: titleText.width
                            height: titleText.height

                            pressed: memory.art = currentText
                            background: Rectangle {
                                color: "#9acd32"
                                border.color: "#fff"
                                border.width: 3
                                radius: 10
                            }


                            font.pixelSize: titleText.height / 3




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

}





