import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4
//I'm not sure whats exactly is happing here. But with save buttom you should sava all fields in Data
//At least "title,art,text" should be working. ^^
//so no comments down here sorry, but perhaps in RequestInput


//Color Design: https://visme.co/blog/website-color-schemes/

//fontcolor = #E27D60
//bordercolor = #E8A87C
//TextAreaColor = #41B3A3
//background = #85DCB0
//header/header = #C38D9E




ApplicationWindow {
    id: window
    background: color = "#85DCB0"

    visible: true
    width: 1080
    height: 1920
    BasicStructure {


    }

    StackView {
        id: stackView
        width: window.width
        height: window.height
        background: color = "#85DCB0"
        visible: true


        initialItem: Page {
            height: window.height

            background: color = "#85DCB0"

                z:0 //!!!!!


            ListView {
                id: listView
                x: 0
                y: 0
                width: window.width
                height: window.height
                delegate: Item {
                    x: 0
                    y:0
                    width: 1080
                    height: 1920




                }
                model: ListModel {
                    ListElement {


                    }
                }
            }


        }
























//            Button {
//               id: inputButton
//               x: 245
//               y: 308
//               width: 567
//               height: 164
//               text: "Input"

//               onClicked: {
//                   stackView.push("MemoryInput.qml")

//                   window.close()

//                   //drawer.close()

//               }

//        }
//            StackView {
//                id: stackView2
//                width: 1020
//                visible: true
//                anchors.bottomMargin: -241
//                anchors.fill : parent
//                      //    initialItem: "RequestInput.qml"
//                        //  initialItem: "HomeForm.ui.qml"
//                       //   anchors.fill: parent
//                   }

    }
}



/*ApplicationWindow {
    background: color = "#FFAEFD"
    id: window


    visible: true
    width: 1029
    height: 1920


}
*/










