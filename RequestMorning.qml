import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4
import io.qt.MoodApp.memory 1.0
import io.qt.MoodApp.memorylist 1.0


//I'm not sure whats exactly is happing here. But with save buttom you should sava all fields in Data
//At least "title,art,text" should be working. ^^
//so no comments down here sorry, but perhaps in RequestInput
// #f0e68c = khaki
ApplicationWindow {
    //    onClosing: {



    //        stackView.push("RequestMenu.qml")
    //        close.accepted = true

    //        //window.close()
    //    }
    background: color = bs.pageTypeColor()
    id: window


    visible: true
    width: availableWidth
    height: availableHeight

    BasicStructure {
        id: bs
        pageType: 1
        titleText:"Random Request"
    }

    Memory {
        id: memory

    }
    MemoryList{
        id: memoryList



        loadRandom : "xyc"


    }

    StackView {
        id: stackView
        width: window.width
        height: window.height

        visible: true
        initialItem: Page {


            background: color = "#00FF00"

            ListView {

                id: listView


                y: bs.titleHeight
                width:window.width
                height: window.height  - bs.menuHeight


                footer: {
                    height : bs.menuHeight
                }
                delegate: Item {
                    x: 0
                    y:0
                    width: 1080
                    height: 1800


                    Row {
                        id: titleRow
                        y:10
                        x: (availableWidth - titleText.width)/2
                        OutputLines {
                            x:0
                            y:0


                            text: memoryList.title
                            id: titleText
                        }



                    }
                    Row {
                        id: textRow
                        y: 20 + titleText.height
                        x: (availableWidth - titleText.width)/2
                        OutputLines {
                            x:0
                            y:0
                            height: titleText.height *5
                            text: memoryList.text
                            id: textText
                        }



                    }
                    Row {
                        id: ownPartRow
                        y: 30 + titleText.height + textRow.height
                        x: (availableWidth - titleText.width)/2
                        OutputLines {
                            x:0
                            y:0
                            text: memoryList.ownPart
                            wrapMode: TextEdit.WordWrap
                            id: ownPartText
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





