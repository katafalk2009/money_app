import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Currency")
    Label {
        id: _curr
        x: root.width / 2 - width / 2
        text: qsTr("Currency")
        font.bold: true
        color: "red"
        font.pointSize: 36
        background: Rectangle {
            color: "lightgreen"
        }
    }

    BalanceList {
        id: balance_list
        width: root.width / 2
        anchors.top: _curr.bottom
        anchors.topMargin: 50
        x: root.width / 4
        spacing: root.width / 8
    }

    Button {
        id: _back
        y: root.height - root.height / 4
        x: root.width / 2 - _back.width / 2
        text: qsTr("Back")
        onClicked: {
            root.close()
        }
    }
    SpendGrid {
        property alias balance_list: balance_list
        y: root.height * 2/5
        }
}
