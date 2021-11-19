#include "contactsmodel.h"

ContactsModel::ContactsModel(QObject *parent)
    : QAbstractListModel(parent)
{
    m_data
            << Data("Kevin Green", "")
            << Data("Adam Patrick", "img.png")
            << Data("Glehn Hudges", "img.png")
            << Data("Samantha Smith", "")
            << Data("Kevin Green", "img.png")
            << Data("Adam Patrick", "img.png")
            << Data("Glehn Hudges", "")
            << Data("Samantha Smith", "img.png")
            << Data("Adam Patrick", "img.png");
}

int ContactsModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    return m_data.count();
}

QVariant ContactsModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    const Data &data = m_data.at(index.row());
    if(role == NameRole)
    {
        return data.name;
    }
    if(role == FaceRole)
    {
        if(data.face == QStringLiteral(""))
        {
            return QVariant(QStringLiteral("noface.png"));
        }
        return data.face;
    }


    return QVariant();
}

QHash<int, QByteArray> ContactsModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[NameRole] = "name";
    names[FaceRole] = "face";

    return names;
}
