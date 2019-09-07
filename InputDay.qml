import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.2
import "."
import io.qt.MoodApp.memory 1.0
import io.qt.MoodApp.memorylist 1.0
Item {
ApplicationWindow {

    id: window
    visible: true
    width: availableWidth
    height: availableHeight
    // title: qsTr("Stack")
    onClosing: {



     //   stackView.push("RequestMenu.qml")
        close.accepted = true


        //window.close()
    }

    Memory {
        // memory Objekt

        // Keys.onReturnPressed: console.log("Return key was pressed")
        id: memory2
    }
    //MomoeryList Element. with "load...: " the QList<Memory> Attribute of this Object is getting load.
    MemoryList {
        id: memoryList1;
        load:""
    }
    //Buttom back
    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            x: -8
            y: 9
            text: "back"
            font.family: "Times New Roman"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                window.close()
      //          stackView.pushRequestMenunu.qml")
                drawer.close()

            }
        }

        Label {
            //   text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    //uper TextFeld
    Flickable {
        id: flickableItem
        focus: true

    }

    TextInput {
        id: textInput
        x: 0
        y: 49
        width: 400
        height: 22
        text: qsTr("Text Input")
        font.pixelSize: 12
    }

    SwipeView {
        id: swipeView
        x: -39
        y: -25
        width: 200
        height: 280
        spacing: 1
        font.family: "Times New Roman"
    }
}

}


/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
