#include "mycontext.h"
#include <QDebug>

MyContext::MyContext(QObject *parent) : QObject(parent), m_myContext(nullptr)
{

}

void MyContext::initMyContext(QQmlApplicationEngine &engine, QQmlContext *myContext)
{
    m_myContext = myContext;

    QString initialUrl = QStringLiteral("localhost:3000");

    m_myContext->setContextProperty(QStringLiteral("utils"), new Utils(&engine));
    m_myContext->setContextProperty(QStringLiteral("initialUrl"),
                                Utils::fromUserInput(initialUrl));
    m_myContext->setContextProperty("MyContext", this);
}


// Fonction to update the QML
void MyContext::loadMyContext()
{
    // Send the data to Qml
    if( m_myContext != nullptr )
    {
//        m_myContext->setContextProperty("modeleProfiles", QVariant::fromValue( m_listOfElem ));
    }
    else
    {
        qDebug() << "Context has not been instantiated";
    }
}


void MyContext::sendActionToCpp(QString nomAction, QString parameter, QString parameter2)
{
    qDebug() << "Calling SATC: nomAction = " << nomAction << endl;

    if (nomAction == "action1")
    {

    }

    if (nomAction == "action2")
    {

    }

}

void MyContext::updateTrek(QString actionType, const float &latitude, const float &longitude, const float &altitude)
{
    if ( actionType == "new Gps Point sent" )
    {
        m_myTrek->addNewGpsPoint(GpsPoint(latitude, longitude, altitude));
    }
}


QString MyContext::truncateUrl(const QString &url)
{
    QString truncated = url;
    return truncated.remove(0, 8);
}
