#include "balancelist.h"

BalanceList::BalanceList(QObject* parent): QAbstractListModel (parent)
{
    m_balance_list = {10, 20, 30};
    m_currencies = {"USD", "EUR", "HRN"};
}

int BalanceList::rowCount(const QModelIndex &parent) const
{
 Q_UNUSED(parent)
    return 3;
}
QHash<int,QByteArray>  BalanceList::roleNames() const
{
    QHash<int,QByteArray> rez;
    rez[QTY]="quantity";
    rez[CURRENCY]="currency";
    return rez;
}

void BalanceList::update_data(int index, QVariant value)
{
    m_balance_list[index] += value.toInt();;
    emit dataChanged(createIndex(0, 0), createIndex(2, 0));
}
QVariant BalanceList::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }
    if (role == QTY) {
    return QVariant::fromValue(m_balance_list[index.row()]);
    }
    if (role == CURRENCY) {
    return QVariant::fromValue(m_currencies[index.row()]);
    }
    return QVariant();
}
