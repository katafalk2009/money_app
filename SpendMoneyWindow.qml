import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Spend Money")
    Label {
        id: _spend
        x: root.width / 2 - width / 2
        text: qsTr("Spend Money")
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
        anchors.top: _spend.bottom
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
    Button {
        id: _button
        anchors.bottom: _back.top
        anchors.bottomMargin: _button.height
        anchors.horizontalCenter: _back.horizontalCenter
        text: "Spend"
        enabled: (_spend_field.money != "" && _spend_field.date != "") ? true : false
        onClicked: update(_spend_field.money)
        function update(value) {
        balance_list.model.update_data(2, -value)
        _spend_field.money = ""
        _spend_field.date = ""
        }
    }
    SpendMoney {
        id: _spend_field
        x: root.width / 15
        y: root.height * 2/5
        }
}
