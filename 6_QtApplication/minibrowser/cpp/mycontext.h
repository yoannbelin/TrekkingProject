#ifndef MYCONTEXT_H
#define MYCONTEXT_H

#include <QObject>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QDebug>

#include "filemanager.h"
#include "trek.h"
#include "user.h"
#include "utils.h"


// Faut peut-etre appeler la classe Utils une fois

class Utils;

class MyContext : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Trek* myTrek READ getMyTrek WRITE setMyTrek NOTIFY myTrekChanged)
    Q_PROPERTY(QList<QObject*> trekList READ getTrekList WRITE setTrekList NOTIFY trekListChanged)
    Q_PROPERTY(User* user READ getUser WRITE setUser NOTIFY userChanged)

    QQmlContext* m_myContext;

    QList<QObject*> m_trekList;
    Trek* m_myTrek;
    User* m_user;

    // File Searching Functions
    void searchUserFile();
    void searchTrekFile();
    void searchPhotoFile();

public:

    explicit MyContext(QObject *parent = nullptr);

    void initMyContext(/*QQmlApplicationEngine &engine, */QQmlContext *myContext);
    void loadMyContext();
    void updateMyContext(QString modelName);


    QString truncateUrl(const QString &url);

    Q_INVOKABLE void sendActionToCpp (QString nomAction, QString parameter = QString (""), QString parameter2 = QString ("") );
    Q_INVOKABLE void updateTrek (double const &latitude, double const &longitude);
    Q_INVOKABLE void startTrek (const QString &trekName, const double &latitude, const double &longitude);


    Trek* getMyTrek() const
    {
        return m_myTrek;
    }

    QList<QObject*> getTrekList() const
    {
        return m_trekList;
    }

    User* getUser() const
    {
        return m_user;
    }

signals:

    void myTrekChanged(Trek* myTrek);

    void trekListChanged(QList<QObject*> trekList);

    void userChanged(User* user);

public slots:



    void setMyTrek(Trek* myTrek)
    {
        if (m_myTrek == myTrek)
            return;

        m_myTrek = myTrek;
        emit myTrekChanged(m_myTrek);
    }
    void setTrekList(QList<QObject*> trekList)
    {
        if (m_trekList == trekList)
            return;

        m_trekList = trekList;
        emit trekListChanged(m_trekList);
    }
    void setUser(User* user)
    {
        if (m_user == user)
            return;

        m_user = user;
        emit userChanged(m_user);
    }
};

#endif // MYCONTEXT_H
