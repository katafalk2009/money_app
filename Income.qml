import QtQuick 2.15
import QtQuick.Controls 2.15
Item {
    id: root
    property alias money: _qty.text
    property alias date: _date.text
    TextField {
        id: _qty
        width: _date.width / 2
        placeholderText: qsTr("0")
    }
    TextField {
        id: _date
        anchors.left: _qty.right
        anchors.leftMargin: 5
        placeholderText: qsTr("01.01.2023")
    }
    ComboBox {
        anchors.left: _date.right
        width: _date.width
        model: [ "Salary", "Gift"]
    }
}
