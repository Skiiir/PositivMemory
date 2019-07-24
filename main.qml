import QtQuick 2.9
import QtQuick.Controls 2.2
//import Users.robin.Documents.MoodLifter.h 1.0
import "."
import io.qt.MoodApp.memory 1.0
import io.qt.MoodApp.memorylist 1.0
ApplicationWindow {
    id: window
    visible: true
//    width: 640
//    height: 480
    width: 1029
    height: 1920
   // title: qsTr("Stack")
    Memory {
       // Gui Objekt
        // Keys.onReturnPressed: console.log("Return key was pressed")
         id: gui
     }


    //var x;
    //Memory memory = new Memory();

    Memory {
        id: gui2
        title: "12"

    }

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

    }
    /*MemoryInput {
        id: memoryIF
        visible: false
    }*/
    RequestInput {
        id: requestIF
        visible: false
    }
    MainMenu {
        visible: false
    }

    Button {
        text: "memory"
        onClicked: memoryIF.visible = true
    }
    Button {
        x: 30
        text: "request"
        onClicked: requestIF.visible = true
    }

}
