import QtQuick 2.15
import QtQuick.Controls 2.2

Label {
    id: _label
    text: currency.toString()
    color: "red"
    font.pointSize: 20
    background: Rectangle {
        color: "white"
        border.color: "black"
        border.width: 1
    }
    Text {
        anchors.left: _label.right
        anchors.leftMargin: 5
        anchors.verticalCenter: _label.verticalCenter
        text: quantity.toString()
        color: "black"
        font.pointSize: 20
    }
}
