#include "changecurrencylist.h"


ChangeCurrencyList::ChangeCurrencyList(QObject* parent): QAbstractTableModel (parent)
{
    m_currencies = {"USD", "EUR"};
}

int ChangeCurrencyList::rowCount(const QModelIndex &parent) const
{
 Q_UNUSED(parent)
    return 2;
}
int ChangeCurrencyList::columnCount(const QModelIndex &parent) const
{
 Q_UNUSED(parent)
    return 2;
}
QHash<int, QByteArray>  ChangeCurrencyList::roleNames() const
{
    QHash<int,QByteArray> rez;
    rez[QTY] = "quantity";
    rez[BUTTON] = "btn";
    rez[DATE] = "date";
    return rez;
}
void ChangeCurrencyList::update(int index, BalanceList* list, QVariant value)
{
   if (index == 0) {
       list->update_data(0, value.toInt());
   }
   if (index == 1) {
       list->update_data(1, value.toInt());
   }
   if (index == 2) {
       list->update_data(0, -value.toInt());
   }
   if (index == 3) {
       list->update_data(1, -value.toInt());
   }
}
QVariant ChangeCurrencyList::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }
    if (role == BUTTON and index.column() == 0) {
    return QVariant::fromValue("Add " + m_currencies[index.row()]);
    }
    if (role == BUTTON and index.column() == 1) {
    return QVariant::fromValue("Spend " + m_currencies[index.row()]);
    }
    return QVariant();
}
