import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Component {

    RowLayout {
        height: 32

        Text {
            text: match_text
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            text: location
        }

    }

}
