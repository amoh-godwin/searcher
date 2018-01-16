import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.2
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 720
    height: 480
    title: "The Love of God"

    GridLayout {

        id: first
        width: parent.width
        height: parent.height
        columns: 1
        columnSpacing: 0

        Rectangle {
            id: rect
            anchors.top: parent.top
            Layout.fillWidth: true
            height: 64
            color: "yellowgreen"

        }

        DropShadow {
            anchors.fill: rect
            horizontalOffset: 0
            verticalOffset: 4
            radius: 8
            samples: 17
            color: "#55000000"
            source: rect
        }


        RowLayout {
            id: search_cont
            anchors.top: rect.bottom
            Layout.fillWidth: true
            anchors.horizontalCenter: parent.horizontalCenter
            height: 100

            Rectangle {
                Layout.maximumWidth: 1136
                Layout.preferredWidth: 1012
                Layout.minimumWidth: 280
                height: 100
                color: "Transparent"

                Row {
                    anchors.centerIn: parent
                    width: 700
                    height: 32

                    Rectangle {
                        id: search_layout
                        width: parent.width
                        height: parent.height
                        radius: 4

                        RowLayout {
                            width: parent.width
                            height: parent.height
                            anchors.fill: parent
                            clip: parent

                            Rectangle {
                                width: 32
                                height: parent.height
                                clip: parent

                                Image {
                                    anchors.centerIn: parent
                                    id: search_icon
                                    source: "images/ic_search_18pt.png"
                                }

                            }

                            Rectangle {
                                id: sFFocus
                                width: parent.width - 76
                                height: parent.height

                                property int len: 0
                                property int prevWidth: 0
                                property int thisCharWidth: 0
                                property int prevCharWidth: 0

                                Text {
                                    x: 0
                                    anchors.verticalCenter: parent.verticalCenter
                                    id: search_text
                                    font.pixelSize: 16
                                    color: "black"
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true

                                    onEntered: {
                                        sFFocus.focus = true
                                    }

                                    onExited: {
                                        sFFocus.focus = false
                                    }

                                }

                                // Key Interactions

                                focus: false
                                Keys.onPressed: {

                                    if(event.key === Qt.Key_Backspace) {
                                        len = search_text.text.length - 1
                                        search_text.text = search_text.text.slice(0, len)
                                    } else {
                                        search_text.text += event.text
                                    }


                                    /****************************************
                                     *                                      *
                                     * Delete and Text Overflow Capability  *
                                     *                                      *
                                     ****************************************/

                                    /*thisCharWidth = search_text.contentWidth - prevWidth
                                    prevWidth = search_text.contentWidth
                                    /*if(search_text.contentWidth < 460) {
                                        /*if(event.key === Qt.Key_Backspace) {
                                            len = search_text.text.length - 1
                                            search_text.text = search_text.text.slice(0, len)
                                        } else {
                                            search_text.text += event.text
                                        }*/
                                    /*}*/
                                    /*else {
                                        /*if(event.key === Qt.Key_Backspace) {
                                            len = search_text.text.length - 1
                                            search_text.text = search_text.text.slice(0, len)
                                            search_text.x += thisCharWidth
                                        } else {
                                            search_text.text += event.text
                                            search_text.x -= thisCharWidth
                                        }*/
                                    /*}*/
                                }
                            }

                            Rectangle {

                                width: 32
                                height: parent.height
                                color: "dodgerblue"
                                clip: parent

                                Image {
                                    anchors.centerIn: parent
                                    id: clickBtn
                                    source: "images/ic_arrow_forward_white.png"
                                }

                            }

                        }

                    }

                    DropShadow {
                        anchors.fill: search_layout
                        horizontalOffset: 0
                        verticalOffset: 0
                        radius: 8
                        samples: 17
                        color: "#3a3a0000"
                        source: search_layout
                    }

                }


            }

        }



    }


    Connections {
        //target: 'text'
    }

}
