import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 1300
    height: 80
    title: "Searcher"
    color: "transparent"
    id: mainWindow
    flags: Qt.Window | Qt.FramelessWindowHint

    property var dynamic_model: [{'match_text': "sdf", 'location': 'locations'}, {'match_text': "sdf", 'location': 'locations'}]
    property QtObject finder

    header: Rectangle {
        width: parent.width
        height: 24
        color: "#55237700"

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 8

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

    ColumnLayout {

        id: first
        width: parent.width
        height: parent.height

        Rectangle {
            id: rect
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            height: 64
            color: "#55237700"

            RowLayout {
                width: parent.width
                anchors {
                    top: parent.top
                    topMargin: 8
                }

                TextField {
                    Layout.fillWidth: true
                    id: search_text
                    font.pixelSize: 14
                    //color: "green"
                }

                Button {
                    text: "Search"
                    onClicked: finder.find(search_text.text)
                }

            }

        }


        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 200
            visible: false

            ListView {
                id: results_view
                anchors.fill: parent
                model: ResultsModel {}
                delegate: ResultsDelegate {}
            }

        }


    }


    Connections {
        target: finder

        function onUpdateResultsModel(model) {
            results_view.model.clear()
            results_view.model.append(model)
        }
    }

}
