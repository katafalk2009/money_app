import QtQuick 2.15
import QtQuick.Controls 2.15
Grid {
    id: root
    columns: 2
    columnSpacing: 200
    rowSpacing: 5
    horizontalItemAlignment: Grid.AlignHCenter
    Label {
        text: qsTr("Quantity")
    }
    Label {
        text: qsTr("Quantity")
    }
    SpendButton {
        property string button_name: qsTr("Add USD")
        button.onClicked: button.update(0, money)
}
    SpendButton {
        property string button_name: qsTr("Spend USD")
        button.onClicked: button.update(0, -money)
    }
    SpendButton {
        property string button_name: qsTr("Add EUR")
        button.onClicked: button.update(1, money)
    }
    SpendButton {
        property string button_name: qsTr("Spend EUR")
        button.onClicked: button.update(1, -money)
    }
    }
