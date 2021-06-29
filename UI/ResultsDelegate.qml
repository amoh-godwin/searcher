import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Component {

    Rectangle {
        width: ListView.view.width
        height: 48
        color: Qt.rgba(255, 255, 255, 0.5)
        Rectangle {
            anchors.fill: parent
            anchors.margins: 4
            radius: 6
            color: Qt.rgba(255, 255, 255, 0.8)

            RowLayout {
                anchors.fill: parent
                anchors.margins: 4

                Text {
                    text: match_text
                    Layout.alignment: Qt.AlignVCenter
                }

                Text {
                    Layout.alignment: Qt.AlignRight
                    text: location
                }

            }
        }

    }

}
