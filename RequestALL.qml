import QtQuick 2.9
import QtQuick.Controls 2.2
import "."
import io.qt.MoodApp.memory 1.0
import io.qt.MoodApp.memorylist 1.0
ApplicationWindow {
    id: window
    visible: true
    width: 1920
    height: 1080
    // title: qsTr("Stack")
    Memory {
        // memory Objekt

        // Keys.onReturnPressed: console.log("Return key was pressed")
        id: memory2
    }
    //MomoeryList Element. with "load...: " the QList<Memory> Attribute of this Object is getting load.
    MemoryList {
        id: memoryList1;
         }
    //Buttom back
    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            x: 0
            y: 0
            text: "back"
            font.family: "Times New Roman"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                window.close()
                stackView.push("MainMenu.qml")
                drawer.close()

            }
        }

        Label {
            //   text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }
    //uper TextFeld


    TextField {
        x:  0
        y :20
        width: 1080
        height: 100
        // text: memory2.text
        font.pixelSize: 50
        Keys.enabled: false
        Keys.onReturnPressed: console.log("Return key was pressed")
        //  wrapMode: 2000
        // objectName: "rect"
        z: 1

      //  text: memoryList1.currentTitle;
           onTextChanged: memoryList1.load = text

        onAccepted:
        {
            memory2.title = text
         //   text = memoryList1.currentTitle;
           // memoryList1.loadMemoryByArt = text

           // memoryList1.test = text
            var str = "";
            var x = memoryList1.length
            for (var i=0; i< x; i++) {
                memoryList1.loadMemoryByIndex = i
                str += memoryList1.title + "\n"
            }
            memoryText.text = str

    }
        }
    //the big TextArea
    TextArea {
        id: memoryText
        x: 0
        y: 300
        width: 1080
        height: 1509
        placeholderText: qsTr("Load...")
        font.pixelSize: 50


    }

    StackView {
        id: stackView
        anchors.bottomMargin: 0
        //   initialItem: "HomeForm.ui.qml"
        anchors.fill: parent
    }
}


