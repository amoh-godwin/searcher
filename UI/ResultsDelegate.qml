import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Component {

    Rectangle {
        width: ListView.view.width
        height: 48
        color: Qt.rgba(255, 255, 255, 0.7)

        RowLayout {
            anchors.fill: parent

            Text {
                text: match_text
                Layout.alignment: Qt.AlignVCenter
            }

            Text {
                text: location
            }

        }

    }

}
