import QtQuick 2.9

import QtQuick.Controls 2.2
//
import QtQuick.Controls 1.4
import "."
import io.qt.MoodApp.memory 1.0

Page {
    id: page
    width: 300
    height: 400

    title: qsTr("Home")


    Rectangle {
        width: 100
        height: 62
      id: root
      x: 100
      y: 193
    }

    Label {
        text: qsTr("Hello myFriend")
        anchors.verticalCenterOffset: -160
        anchors.horizontalCenterOffset: -51
        anchors.centerIn: parent
    }

    TextInput {
        id: textInput
        x: 62
        y: 88
        width: 80
        height: 20
        text: qsTr("Text Input")
        font.pixelSize: 12
    }

    Text {
        id: element
        x: 62
        y: 68
        width: 87
        height: 14
        text: qsTr("Tell me how hard?")
        font.pixelSize: 12
    }

    Text {
        id: element1
        x: 62
        y: 140
        width: 126
        height: 14
        text: qsTr("Titel")
        font.pixelSize: 12
    }

    Text {
        id: element2
        x: 62
        y: 126
        width: 80
        height: 14
        text: qsTr("Was is denn passiert")
        font.pixelSize: 12
    }
}
