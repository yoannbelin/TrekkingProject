#ifndef MYCONTEXT_H
#define MYCONTEXT_H

#include <QObject>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QDebug>

#include "utils.h"
#include "filemanager.h"
#include "trek.h"


// Faut peut-etre appeler la classe Utils une fois

class Utils;

class MyContext : public QObject
{
    Q_OBJECT
    /*
        Q_PROPERTY(Trekking* myElem READ getMyElem WRITE setMyElem NOTIFY myElemChanged)
        Q_PROPERTY(QList<QObject*> listOfElem READ getListOfElem WRITE setListOfElem NOTIFY listOfElemChanged)
    */
    Q_PROPERTY(Trek* myTrek READ getMyTrek WRITE setMyTrek NOTIFY myTrekChanged)
    //    Q_PROPERTY(GpsPoint nextGpsPoint READ getNextGpsPoint WRITE setNextGpsPoint NOTIFY nextGpsPointChanged)

    QQmlContext* m_myContext;

    Trek* m_myTrek;

public:

    explicit MyContext(QObject *parent = nullptr);

    void initMyContext(/*QQmlApplicationEngine &engine, */QQmlContext *myContext);
    void loadMyContext();
    void updateMyContext(QString modelName);

    QString truncateUrl(const QString &url);

    Q_INVOKABLE void sendActionToCpp (QString nomAction, QString parameter = QString (""), QString parameter2 = QString ("") );
    Q_INVOKABLE void updateTrek (QString actionType, double const &latitude, double const &longitude);


    Trek* getMyTrek() const
    {
        return m_myTrek;
    }

signals:



    void myTrekChanged(Trek* myTrek);

public slots:



    void setMyTrek(Trek* myTrek)
    {
        if (m_myTrek == myTrek)
            return;

        m_myTrek = myTrek;
        emit myTrekChanged(m_myTrek);
    }
};

#endif // MYCONTEXT_H
