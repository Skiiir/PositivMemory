import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4
import io.qt.MoodApp.engine 1.0

TextArea {
  //  property var textColor
    readOnly: true


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
    color: "#000000"
    placeholderTextColor : color
    x:(engine.displayWidth-width)/2


    wrapMode: TextEdit.WordWrap
    font.pixelSize: engine.displayHeight / 30


}
