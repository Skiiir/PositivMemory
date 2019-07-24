import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4
import io.qt.MoodApp.engine 1.0

//watch id for identify Item.

Item {


x:0
y:0

    Engine {
        id: engine
        //
         displayWidth : 1
        displayHeight : 1
    }
    width: engine.displayWidth
    height: engine.displayHeight


    property var openInput: false
    property var openOutput: false
    property var titleText
    //property var windowHeight:  it.height//800 //Android:1920
    //property var windowWidth:it.width
    property var menuHeight: it.height / 10
    property var titleHeight: it.height / 10

   property int pageType                             // 0- input 1- output
  //)  property var backGroundColor
    property var inputColor:"#ff7f50"//"#ff7373"
    property var outputColor: "#0ac8e3"





    id: it
    z: 1


    function closeMenu () {

        inputOneEvent.visible = false
        inputDay.visible = false

        goodMorning.visible = false
        motivation.visible = false
        all.visible = false
    }
    function otherPageTypeColor() {
        if (pageType===0) {
            return  outputColor;
        }
        else if (pageType===1) {
            return  inputColor;
        }
        else {
            return "#000000";

        }

    }

    function pageTypeColor() {
        if (pageType===1) {
            return  outputColor;
        }
        else if (pageType===0) {
            return  inputColor;
        }
        else {
            return "#000000";

        }

    }




    TextArea {

        background: Rectangle{
            width: it.width
            height: titleHeight
            color: "#000000"
            radius: 10
            border.color: "#ffffff"
            border.width: 4
        }
        readOnly: true



        horizontalAlignment :TextEdit.AlignHCenter
        width: it.width
        height: titleHeight
        //x:(it.width-width) / 2
        y: 0
        text: titleText
        color: pageTypeColor()
        font.pixelSize: engine.displayHeight /25
    }


    //Rectangle for same background as buttomcolor in Bottom menu
    Rectangle {
        x:0
        y: it.height - height
        width: it.width
        height: inputMenu.height
        color: pageTypeColor()


    }


    //MENU LEFT -- INPUT
    MenuButtom{
        id: inputMenu
        x:0// it.width - width
        y: it.height - height
        anchors.bottom: parent.bottom


        backGroundColor: inputColor
        textColor:inputColor
        borderColor: "black"
        buttomText: "Input"
        onClicked: {

            if (!openInput) {
                openInput = true
                inputOneEvent.visible = true
                inputDay.visible = true
                goodMorning.visible = false
                motivation.visible = false
                all.visible = false

            } else {
                inputOneEvent.visible = false
                inputDay.visible = false
                openInput = false

            }



        }
    }
    MenuButtom{
        id: inputOneEvent
        x:0// it.width - width
        y: it.height - height * 2
        buttomText: "One Event"
        visible: false
        backGroundColor: inputColor
        textColor:inputColor
        borderColor: "black"
        onClicked: {
            closeMenu()
            stackView.push("InputOneEvent.qml")
            window.close()
        }

    }
    MenuButtom{
        id:inputDay
        x:0// it.width - width
        y: it.height - height * 3
        buttomText: "Day"
        visible: false
        backGroundColor: inputColor
        textColor:inputColor
        borderColor: "black"


    }

    // Request Menu Right
    MenuButtom{
      //  id: requestMenu
        x: it.width - width
        y: it.height - height
        buttomText: "Output"
        backGroundColor: outputColor
        textColor:outputColor
        borderColor: "black"
        onClicked: {

            if (! openOutput) {
                goodMorning.visible = true
                motivation.visible = true
                all.visible = true
                inputOneEvent.visible = false
                inputDay.visible = false
                openInput = false
                openOutput = true
            } else {
                goodMorning.visible = false
                motivation.visible = false
                all.visible = false

                openOutput = false

            }



        }
    }
    MenuButtom{
        id: goodMorning
        x:it.width - width
        y: it.height - height * 2
        buttomText: "Good Morning"
        visible: false
        backGroundColor: outputColor
        textColor:outputColor
        borderColor: "black"
        onClicked: {
            closeMenu()
            stackView.push("RequestMorning.qml")
            window.close()
        }

    }
    MenuButtom{
        id: motivation
        x: it.width - width
        y: it.height - height * 3
        buttomText: "Motivation Please!"
        visible: false
        backGroundColor:outputColor
        textColor:outputColor
        borderColor: "black"
    }
    MenuButtom{
        id: all
        x: it.width - width
        y: it.height - height * 4
        buttomText: "Show All"
        visible: false
        backGroundColor: outputColor
        textColor:outputColor
        borderColor: "black"
        onClicked: {
            closeMenu()
            stackView.push("RequestViewALL.qml")
            window.close()
        }
    }

}
