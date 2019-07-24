import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Controls 2.5
import "."
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    onClosing: {



        if (nextPage == "morning")  {
            stackView.push("RequestMorning.qml")
        } else if (nextPage == "all") {
            stackView.push("RequestViewAll.qml")

        } else {
            stackView.push("MainMenu.qml")
        }

        close.accepted = true

        //window.close()
    }

    property var nextPage : ""
    id: window
    background: color = "#85DCB0"

    visible: true
    width: 1029
    height: 1920


    StackView {
        id: stackView
        width: window.width
        height: window.height

        visible: true


        initialItem: Page {
            height: window.height

            background: color = "#85DCB0"
            header: ToolBar {
                width: availableWidth
                height: toolButton.height
                background: Rectangle {


                    color: "#C38D9E"
                }
                Button {
                    id: toolButton
                    x: 0
                    y: 0
                    width: window.width / 6
                    height:   window.height / 20
                    background: Rectangle {
                        color: "#41B3A3"
                        border.color: "#E8A87C"
                        border.width: 3
                        radius: 10
                    }
                    //  Text {

                    contentItem: Text {
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        text: "back"

                        color: "#E27D60"
                        font.pixelSize: window.height / 40
                    }


                    onClicked: {
                        //stackView.push("MainMenu.qml")
                        nextPage = "main"

                        window.close()
                    }
                }
            }




            ListView {
                id: listView
                x: 0
                y: 0
                width: window.width
                height: window.height
                delegate: Item {

                    x: 0
                    y:0
                    width: 1080
                    height: 1800
                    Row {
                        id: morningRow
                       y: window.width / 8
                        x: window.width / 4


                        Button {
                            id: requestButton
                            //   x: window.width / 4 + window.width / 2

                            width: window.width / 2
                            height: window.height / 8
                            background: Rectangle {

                                color: "#41B3A3"
                                border.color: "#E8A87C"
                                border.width: 4


                                radius: 50
                            }
                            contentItem: Text {
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                text: "Guten Morgen"

                                color: "#E27D60"
                                font.pixelSize: window.height / 40
                            }
                            onClicked: {
                                nextPage = "morning"
                                //     stackView.push("RequestMorning.qml")
                                window.close()
                            }
                        }
                    }
                    Row {
                        id: titleRow2

                        x: window.width / 4
                        y: window.width / 4 + morningRow.y

                        Button {
                            id: requestButton2
                            //   x: window.width / 4 + window.width / 2

                            width: window.width / 2
                            height: window.height / 8
                            background: Rectangle {

                                color: "#41B3A3"
                                border.color: "#E8A87C"
                                border.width: 4


                                radius: 50
                            }
                            contentItem: Text {
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                text: "Request"

                                color: "#E27D60"
                                font.pixelSize: window.height / 45
                            }
                            onClicked: {
                                nextPage = "all"
                                // stackView.push("RequestViewAll.qml")
                                window.close()
                            }
                        }
                    }



                }
                model: ListModel {
                    ListElement {


                    }
                }
            }


        }
    }
}









