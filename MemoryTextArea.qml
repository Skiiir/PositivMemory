import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4
import io.qt.MoodApp.engine 1.0
import io.qt.MoodApp.memorylist 1.0

TextArea {
  //  property var textColor
    MemoryList {

id:memoryList
    }
    Item {
        id:area

        function loadOneMemorys() {
            var str ="";
            memoryList.load = "";
            for(var i=0;i<memoryList.length;i++) {
                    memoryList.loadMemoryByIndex = i;
                    str = str + "Title:" + memoryList.title + "\n" + memoryList.art +"\n"+ memoryList.text + "\n" + memoryList.ownPart + "\n" + "\n";
                    }
        return str;
    }
    }

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
   // height: engine.displayHeight / 2
    font.hintingPreference: Font.PreferVerticalHinting
    color: "#000000"//"#00FF00"
    text :  (area.loadOneMemorys())
    x:(engine.displayWidth-width)/2


    wrapMode: TextEdit.WordWrap
    font.pixelSize: engine.displayHeight / 30


}
