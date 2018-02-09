#include "user.h"

User::User(QObject *parent) : QObject(parent)
{
    m_idUser = 0;
    m_username = "";
    m_password = "";
    m_email = "";
}

User::User(const int &idUser, const QString &username, const QString &password,
           const QString &email, QObject *parent):
    m_idUser(idUser), m_username(username), m_password(password),
    m_email(email), QObject(parent)
{

}

User::User( QStringList &userData, QObject *parent): QObject(parent)
{
    QStringList userAttributes;
    QString userInfoLine;


    for (QString line : userData)
    {
        userInfoLine = line; // There should only be one line
    }

    userAttributes << userInfoLine.split(";");

    if (userAttributes.length() == 4)
    {
        m_idUser = userAttributes[0].toInt();
        m_username = userAttributes[1];
        m_password = userAttributes[2];
        m_email = userAttributes[3];
    }
}

QStringList User::userSQLFormat()
{
    QStringList userData("");

    userData += QString::number(getIdUser()) + ";" +
            getUsername() + ";" +
            getPassword() + ";" +
            getEmail();

    return userData;
}

