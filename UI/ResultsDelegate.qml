import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Component {

    Rectangle {
        width: parent.width
        height: 48
        color: "white"

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
