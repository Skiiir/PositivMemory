import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4
// you can acces Propertys to handle Colors for idivdual buttom and text
Button{

    property var backGroundColor
    property var textColor
    property var borderColor

    property var buttomText

    background: Rectangle {
        width: it.width/2
        height: it.height/10

        color: backGroundColor
        border.color: borderColor
        border.width: 4


        radius: 20
    }


    width: it.width/2
    height: it.height/10

    contentItem: Text {

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        text: buttomText

        color: "#000000"
        font.pixelSize: window.height / 40
    }



}

