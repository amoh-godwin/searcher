import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Component {

    Rectangle {
        height: 48
        color: "dodgerblue"

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
