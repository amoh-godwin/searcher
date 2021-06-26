import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 720
    height: 480
    title: "The Love of God"

    property var dynamic_model: [{'match_text': "sdf", 'location': 'locations'}, {'match_text': "sdf", 'location': 'locations'}]
    property QtObject searcher


    ColumnLayout {

        id: first
        width: parent.width
        height: parent.height
        //columns: 1
        //columnSpacing: 0

        Rectangle {
            id: rect
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            height: 64
            color: "yellowgreen"

            layer.enabled: true
            layer.effect: DropShadow {
                anchors.fill: rect
                horizontalOffset: 0
                verticalOffset: 4
                radius: 8
                samples: 17
                color: "#77000000"
                source: rect
            }

        }

        RowLayout {
            id: search_cont
            Layout.fillWidth: true
            Layout.topMargin: 0
            Layout.alignment: Qt.AlignHCenter | Qt.AlignAbsolute
            height: 100

            Rectangle {
                Layout.maximumWidth: 1280
                Layout.preferredWidth: 480
                Layout.minimumWidth: 280
                height: 100
                color: "Transparent"

                RowLayout {
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

                                TextField {
                                    x: 0
                                    width: parent.width
                                    anchors.verticalCenter: parent.verticalCenter
                                    id: search_text
                                    font.pixelSize: 14
                                    //color: "green"
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    cursorShape: Qt.IBeamCursor

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


                                    /*
                                      This prevents the textfield from overflowing by stoping its propagation
                                    */
                                    if(event.key === Qt.Key_Backspace) {
                                        len = search_text.text.length - 1
                                        search_text.text = search_text.text.slice(0, len)

                                    } else if(search_text.contentWidth >= 624){
                                        // do nothing
                                    } else {
                                        search_text.text += event.text
                                    }
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

                                MouseArea {
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                }

                            }

                        }

                        layer.enabled: true
                        layer.effect: DropShadow {
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


        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 200

            ListView {
                id: results_view
                anchors.fill: parent
                model: ResultsModel {}
                delegate: ResultsDelegate {}

                //Component.onCompleted: model.append(dynamic_model)
            }

        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
        }


    }


    Connections {
        target: searcher

        function updateResultsModel(model) {
            results_view.model.clear()
            results_view.model.append(model)
        }
    }

}
