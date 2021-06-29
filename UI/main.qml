import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: screen.width
    height: results_cont.height + 80
    title: "Searcher"
    color: "transparent"
    id: mainWindow
    flags: Qt.Window | Qt.FramelessWindowHint

    property int setX
    property int setY

    property var dynamic_model: [{'match_text': "sdf", 'location': 'locations'}, {'match_text': "sdf", 'location': 'locations'}]
    property QtObject finder
    signal updateView(var model)


    onUpdateView: {

        results_view.model.clear()

        for (var i=0; i<model.length; i++) {
            if (results_cont.pref_height < screen.height - 148) {
                results_cont.pref_height += 52
            }

            results_view.model.append(model[i])
        }
    }


    Rectangle {
        width: parent.width
        height: 88
        clip: true

        Image {
            source: "./images/paper.jpg"
        }

    }

    ColumnLayout {

        id: first
        width: parent.width
        height: parent.height
        spacing: 0

        Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 24
                color: "transparent"//"#55237700"

                MouseArea {
                    anchors.fill: parent

                    onPressed: {
                        setX = mouseX
                        setY = mouseY
                    }

                    onMouseXChanged: {
                        var dx = mouseX - setX
                        mainWindow.x = mainWindow.x + dx
                    }

                    onMouseYChanged:  {
                        var dy = mouseY - setY
                        mainWindow.y = mainWindow.y + dy
                    }

                }

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 8
                    anchors.rightMargin: 8

                    Text {
                        text: "Searcher"
                        color: "white"
                        font.pixelSize: 16
                    }

                    Button {
                        Layout.alignment: Qt.AlignRight
                        text: "-"
                        font.pixelSize: 16

                        onClicked: mainWindow.showMinimized()

                        background: Rectangle {
                            implicitWidth: 28
                            implicitHeight: 28
                            color: parent.hovered ? "#55ffffff" : "transparent"
                        }

                        contentItem: Text {
                            text: parent.text
                            color: "white"
                            font: parent.font
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }

                    }

                }

            }

        Rectangle {
            id: rect
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            height: 64
            color: "transparent"//"#55237700"

            RowLayout {
                width: parent.width
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    topMargin: 8
                    leftMargin: 8
                    rightMargin: 8
                }

                CustTextField {
                    Layout.fillWidth: true
                    id: search_text
                    font.pixelSize: 14
                    //color: "green"
                }

                Button {
                    Layout.preferredWidth: 78
                    text: "Search"
                    onClicked: finder.find(search_text.text)

                    background: Rectangle {
                        implicitWidth: 78
                        implicitHeight: 32
                        color: "transparent"
                        border.color: "white"
                    }

                    contentItem: Text {
                        text: parent.text
                        font: parent.font
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

            }

        }


        Rectangle {
            id: results_cont
            Layout.fillWidth: true
            Layout.preferredHeight: results_cont.pref_height
            color: "#25ffffff"

            property int pref_height: 0

            ScrollView {
                anchors.fill: parent
                clip: true

                ListView {
                    id: results_view
                    anchors.fill: parent
                    model: ResultsModel {}
                    delegate: ResultsDelegate {}
                    //spacing: 4

                    //Component.onCompleted: updateView(dynamic_model) //results_view.model.append(dynamic_model)
                }
            }

        }


    }


    Connections {
        target: finder

        function onUpdateResultsModel(model) {
            //results_view.model.clear()
            //results_view.model.append(model)
            updateView(model);
        }
    }

}
