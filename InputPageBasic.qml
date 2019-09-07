import QtQuick 2.9
import QtQuick.Controls 2.12
//import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4
import io.qt.MoodApp.memory 1.0
import io.qt.MoodApp.engine 1.0

//I'm not sure whats exactly is happing here. But with save buttom you should sava all fields in Data
//At least "title,art,text" should be working. ^^


ApplicationWindow {
  //  background: color = bs.pageTypeColor()
    id: window
    width: 1200

    onClosing: {

       // stackView.push("RequestMenu.qml")
        close.accepted = true

        //window.close()
    }


    visible: true
    Memory {
        id: memory


    }

    SwipeView {
        id: swipeView
        x: 9
        y: 6
        width: 1467
        height: 988
    }
}







