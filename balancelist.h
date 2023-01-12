#pragma once
#include <QAbstractListModel>


class BalanceList : public QAbstractListModel
{
    Q_OBJECT
    enum RoleTypes
    {
        QTY = Qt::UserRole+1,
        CURRENCY
    };
public:
    BalanceList(QObject* parent = nullptr);
    int rowCount(const QModelIndex& parent = QModelIndex {}) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    QHash<int,QByteArray>   roleNames() const override;
    Q_INVOKABLE void update_data(int index, QVariant value);
private:
    std::vector<int> m_balance_list;
    std::vector<QString> m_currencies;
};
