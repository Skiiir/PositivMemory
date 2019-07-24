import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 600
    height: 400
    
    title: qsTr("Page 1")
    
    Label {
        text: qsTr("You are on Page 1.")
        anchors.centerIn: parent
    }
    
    Text {
        id: element
        x: 2
        y: 83
        width: 164
        height: 77
        text: qsTr("Text")
        font.pixelSize: 12
    }
}
