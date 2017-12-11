#ifndef MYCONTEXT_H
#define MYCONTEXT_H

#include <QObject>
#include <QQmlContext>
#include "elementcreator.h"


class MyContext : public QObject
{
    Q_OBJECT

    Q_PROPERTY(ElementCreator* myElem READ getMyElem WRITE setMyElem NOTIFY myElemChanged)
    Q_PROPERTY(QList<QObject*> listOfElem READ getListOfElem WRITE setListOfElem NOTIFY listOfElemChanged)


    QQmlContext* m_myContext;
    ElementCreator* m_myElem;

    QList<QObject*> m_listOfElem;

public:


    explicit MyContext(QObject *parent = nullptr);

    void setMyContext(QQmlContext *myContext);
    void loadMyContext();
    void updateMyContext(QString modelName);

    QString truncateUrl(const QString &url);

    Q_INVOKABLE void sendActionToCpp (QString nomAction, QString parameter = QString (""), QString parameter2 = QString ("") );

    ElementCreator* getMyElem() const
    {
        return m_myElem;
    }


    QList<QObject*> getListOfElem() const
    {
        return m_listOfElem;
    }

signals:

    void myElemChanged(ElementCreator* myElem);

    void listOfElemChanged(QList<QObject*> listOfElem);

public slots:

    void setMyElem(ElementCreator* myElem)
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
};

#endif // MYCONTEXT_H
