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
    property QtObject finder


    ColumnLayout {

        id: first
        width: parent.width
        height: parent.height

        Rectangle {
            id: rect
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            height: 64
            color: "yellowgreen"


            TextField {
                x: 0
                width: parent.width
                anchors.verticalCenter: parent.verticalCenter
                id: search_text
                font.pixelSize: 14
                //color: "green"
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
        target: finder

        function onUpdateResultsModel(model) {
            results_view.model.clear()
            results_view.model.append(model)
        }
    }

}
