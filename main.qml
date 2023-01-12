import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Spending")
    Label {
        id: _balance
        x: root.width / 2 - width / 2
        text: qsTr("Balance")
        font.bold: true
        color: "red"
        font.pointSize: 36
        background: Rectangle {
            color: "lightgreen"
        }
    }
    BalanceList {
        width: root.width / 2
        anchors.top: _balance.bottom
        anchors.topMargin: 50
        x: root.width / 4
        spacing: root.width / 8
    }
    Button {
        id: _stat
        y: root.height - root.height / 4
        x: root.width / 10
        text: qsTr("Statistics")
    }
    Button {
        id: _new
        anchors.left: _stat.right
        anchors.leftMargin: width/5
        anchors.verticalCenter: _stat.verticalCenter
        text: qsTr("Add new spending")
    }
    Button {
        id: _curr
        anchors.left: _new.right
        anchors.leftMargin: width/5
        anchors.verticalCenter: _stat.verticalCenter
        text: qsTr("Add currency operation")
        onClicked: {
            var component = Qt.createComponent("CurrencyWindow.qml");
            var win = component.createObject(root);
            win.show();
        }
    }
}
