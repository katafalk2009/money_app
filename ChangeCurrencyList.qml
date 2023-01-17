import QtQuick 2.15
import ChangeCurrency 1.0;

TableView {
    id: _view
    model: ChangeCurrencyListModel {}
    delegate: CurrencyButton {
    }
    interactive: false
}
