import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4
import io.qt.MoodApp.memory 1.0
import io.qt.MoodApp.engine 1.0
import QtQuick.Window 2.2
//I'm not sure whats exactly is happing here. But with save buttom you should sava all fields in Data
//At least "title,art,text" should be working. ^^

import QtQuick.Controls 2.5
ApplicationWindow {
    //  background: color = bs.pageTypeColor()
    id: window
    width: Screen.desktopAvailableWidth *3
    height: Screen.desktopAvailableHeight

    visible: true
    onClosing: {

        // stackView.push("RequestMenu.qml")
        close.accepted = true

        //window.close()
    }



    Memory {
        id: memory


    }
    SwipeView {
        id: swipeView
        x: 0
        y: 0
        currentIndex: 0
        anchors.fill: parent
        height: Screen.desktopAvailableHeight
        Item {
            id: firstPage


            InputDatePage {


            }

        }
        Item {
            id: secondPage
            BasicStructure {
                id: basicStructure
                x: 8
                y: 8
                width: Screen.desktopAvailableWidth
                height: Screen.desktopAvailableHeight
            }
        }



        PageIndicator {
            id: indicator

            count: view.count
            currentIndex: view.currentIndex

            anchors.bottom: view.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }



    }

}







