import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4
import io.qt.MoodApp.engine 1.0
import QtGraphicalEffects 1.12
TextArea {
    //  property var textColor

    background: BackgroundRectangle {}
    Engine {
        id:engine
        displayHeight: 0
        displayWidth: 0
    }

    BasicStructure{
        visible: false
        id: basic
    }

    textMargin: 4

    width: engine.displayWidth - engine.displayWidth /14
    height: engine.displayHeight / 30 + engine.displayHeight / 15
    font.hintingPreference: Font.PreferVerticalHinting
    color: "#000000"// "#FF8C00"//"#00FF00"
    placeholderTextColor : color
    x:(engine.displayWidth-width)/2
    Item {
    DropShadow {
        horizontalOffset: -20
        radius: 4
        samples: 9
        color: "#000000"
        verticalOffset: 0
        spread: 0
    }
    }
    wrapMode: TextEdit.WordWrap
    font.pixelSize: engine.displayHeight / 30


}
