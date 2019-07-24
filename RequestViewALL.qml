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



        load: ""


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
                    width: window.width
                    height: titleText.height


                    Row {
                        id: titleRow
                        y:10
                        x: (availableWidth - titleText.width)/2
                        MemoryTextArea {
                            x:0
                            y:0
                            //var x;
                            //memoryList.loadMemoryByIndex : "2"




                            id: titleText
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





