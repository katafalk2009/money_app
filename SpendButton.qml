import QtQuick 2.15
import QtQuick.Controls 2.15
Button {
    property alias button: _button
    property alias money: _qty.text
    property alias date: _date.text
    Button {
        id: _button
        text: button_name
        enabled: (money != "" && date != "") ? true : false
        function update(index, value) {
        root.balance_list.model.update_data(index, value.toString())
        money = ""
        date = ""
        }
}
    TextField {
        id: _qty
        width: _button.width * 2/3
        anchors.left: _button.right
        anchors.leftMargin: 5
        placeholderText: qsTr("0")
    }
    TextField {
        id: _date
        width: _button.width
        anchors.left: _qty.right
        anchors.leftMargin: 5
        placeholderText: qsTr("27.11.1991")
    }
}
