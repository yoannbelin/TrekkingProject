#include "user.h"

User::User(QObject *parent) : QObject(parent)
{
    m_username = "";
    m_password = "";
    m_email = "";
    m_idUser = 0;
}

User::User(const QString &username, const QString &password,
           const QString &email, const int &idUser, QObject *parent):
            m_username(username), m_password(password),
            m_email(email), m_idUser(idUser), QObject(parent)
{

}

