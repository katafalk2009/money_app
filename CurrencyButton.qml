import QtQuick 2.15
import QtQuick.Controls 2.15
Item {
    id: root
    property alias button: _button
    property alias money: _qty.text
    property alias date: _date.text
    Button {
        id: _button
        text: btn.toString()
        enabled: (money != "" && date != "") ? true : false
        onClicked: update(index, money)
        function update(index, value) {
        _view.model.update(index, _view.balance_list.model, value)
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
        placeholderText: qsTr("01.01.2023")
    }
}
