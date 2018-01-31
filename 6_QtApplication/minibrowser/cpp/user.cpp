#include "user.h"

User::User(QObject *parent) : QObject(parent)
{
    //    m_idUser = 0;
    m_username = "";
    m_password = "";
    m_email = "";
}

User::User(const int &idUser, const QString &username,
           const QString &password, const QString &email, QObject *parent):
    m_idUser(idUser), m_username(username),
    m_password(password), m_email(email), QObject(parent)
{

}

void User::initUserFile()
{
    setFilemanager(new FileManager ("user", "info"));
}

void User::updateUserFile()
{
    initUserFile();

    QStringList userInfo ("");

    userInfo += getIdUser() + ";" + getUsername()
            + ";" + getPassword() + ";" + getEmail();

    m_filemanager.updateFile(userInfo);

    qDebug() << "user_info created";
    qDebug() << userInfo;
}

