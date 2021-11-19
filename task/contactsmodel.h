#ifndef CONTACTSMODEL_H
#define CONTACTSMODEL_H

#include <QAbstractListModel>

struct Data {
    Data() {}
    Data(const QString &name, const QString &face) : name(name), face(face){}
    QString name;
    QString face;
};

class ContactsModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit ContactsModel(QObject *parent = nullptr);

    enum Roles {
        NameRole = Qt::UserRole,
        FaceRole
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

private:
QVector < Data > m_data;
};

#endif // CONTACTSMODEL_H
