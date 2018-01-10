#ifndef MYCONTEXT_H
#define MYCONTEXT_H

#include <QObject>
#include <QQmlContext>
#include <QQmlApplicationEngine>
//#include "Trekking.h"
#include "utils.h"

// Faut peut-etre appeler la classe Utils une fois

class Utils;

class MyContext : public QObject
{
    Q_OBJECT
/*
    Q_PROPERTY(Trekking* myElem READ getMyElem WRITE setMyElem NOTIFY myElemChanged)
    Q_PROPERTY(QList<QObject*> listOfElem READ getListOfElem WRITE setListOfElem NOTIFY listOfElemChanged)
*/

    QQmlContext* m_myContext;


public:


    explicit MyContext(QObject *parent = nullptr);

    void initMyContext(QQmlApplicationEngine &engine, QQmlContext *myContext);
    void loadMyContext();
    void updateMyContext(QString modelName);

    QString truncateUrl(const QString &url);

    Q_INVOKABLE void sendActionToCpp (QString nomAction, QString parameter = QString (""), QString parameter2 = QString ("") );

    /*
    Trekking* getMyElem() const
    {
        return m_myElem;
    }


    QList<QObject*> getListOfElem() const
    {
        return m_listOfElem;
    }
    */

signals:

    /*
    void myElemChanged(Trekking* myElem);

    void listOfElemChanged(QList<QObject*> listOfElem);
    */

public slots:

    /*
    void setMyElem(Trekking* myElem)
    {
        if (m_myElem == myElem)
            return;

        m_myElem = myElem;
        emit myElemChanged(m_myElem);
    }

    void setListOfElem(QList<QObject*> listOfElem)
    {
        if (m_listOfElem == listOfElem)
            return;

        m_listOfElem = listOfElem;
        emit listOfElemChanged(m_listOfElem);
    }
    */

};

#endif // MYCONTEXT_H
