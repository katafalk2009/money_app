import QtQuick 2.15
import Balance 1.0;

ListView {
    id: _view
    model: BalanceListModel {}
    orientation: ListView.Horizontal
    delegate: BalanceField {
    }
}
