#include "mycontext.h"
#include <QDebug>


MyContext::MyContext(QObject *parent) : QObject(parent), m_myContext(nullptr)
{
    m_myTrek = new Trek;

    setErrorMessage("");

    searchUserFile();
    searchTrekFile();
    searchPhotoFile();
}

void MyContext::initMyContext(/*QQmlApplicationEngine &engine,*/ QQmlContext *myContext)
{
    m_myContext = myContext;

    QString initialUrl = QStringLiteral("localhost:3000");

    //    m_myContext->setContextProperty(QStringLiteral("utils"), new Utils(&engine));
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
        m_myContext->setContextProperty("trekList", QVariant::fromValue( m_trekList ));
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

void MyContext::updateTrek(const double &latitude, const double &longitude)
{
    m_myTrek->addNewGpsPoint(GpsPoint(latitude, longitude));

    //    m_myContext->setContextProperty("MyContext", this);
}

void MyContext::startTrek(const QString &trekName,const double &latitude, const double &longitude)
{
    delete m_myTrek;
    m_myTrek = nullptr;
    setMyTrek(new Trek (trekName, latitude, longitude));
    qDebug() << "New Trek Created";
}


QString MyContext::truncateUrl(const QString &url)
{
    QString truncated = url;
    return truncated.remove(0, 8);
}


// File Searching Functions

void MyContext::searchUserFile()
{
    // if there is a file, instantiate a user && auto login
    // else m_user = nulptr && no auto login
}

void MyContext::searchTrekFile()
{
    // if there is a file, load the trek && message (save, delete or continue)
    // else m_myTrek = nullptr
}

void MyContext::searchPhotoFile()
{
    // what to do here??
}
