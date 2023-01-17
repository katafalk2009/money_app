#pragma once
#include <QAbstractListModel>
#include "balancelist.h"


class ChangeCurrencyList : public QAbstractTableModel
{
    Q_OBJECT
    enum RoleTypes
    {
        BUTTON = Qt::UserRole+1,
        QTY,
        DATE
    };
public:
    ChangeCurrencyList(QObject* parent = nullptr);
    int rowCount(const QModelIndex& parent = QModelIndex {}) const override;
    int columnCount(const QModelIndex& parent = QModelIndex {}) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    QHash<int,QByteArray> roleNames() const override;
    Q_INVOKABLE void update(int index, BalanceList* list, QVariant value);
private:
    std::vector<QString> m_currencies;
};
