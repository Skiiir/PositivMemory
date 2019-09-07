import QtQuick 2.0
import QtQuick.Window 2.0
//import QtQuick.Controls 2.2
import "."
import io.qt.MoodApp.memory 1.0
import io.qt.MoodApp.memorylist 1.0
import QtQuick.Controls 1.4

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQml 2.2
       Item {
    // title: qsTr("Stack")


           width: Screen.desktopAvailableWidth
           height: Screen.desktopAvailableHeight



           Calendar {
               x: 119
               y: 422
               width: 565
               height: 466

           }

           BasicStructure {
               id: basicStructure
               x: 0
               y: 0
               width: Screen.desktopAvailableWidth
               height: Screen.desktopAvailableHeight

               TextInputLines {
                   id: textInputLines
                   x: 52
                   y: 248
                   width: 1820
                   height: 126
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignHCenter
               }

               OutputLines {
                   id: outputLines
                   x: 64
                   y: 122
                   width: 1792
                   height: 98
                   text: "Title:"
                   verticalAlignment: Text.AlignVCenter
                   horizontalAlignment: Text.AlignHCenter
               }

               CheckBox {
                   id: checkBox
                   x: 852
                   width: 416
                   height: 90
                   checked:true

                   text: qsTr("To Day?")
                   anchors.top: parent.top
                   anchors.topMargin: 448

                   indicator.width: 64
                   indicator.height: 64
               }
           }



}












/*##^## Designer {
    D{i:5;anchors_y:460}
}
 ##^##*/
