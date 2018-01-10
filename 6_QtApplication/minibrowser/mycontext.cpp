#include "mycontext.h"
#include <QDebug>

MyContext::MyContext(QObject *parent) : QObject(parent), m_myContext(nullptr)
{
//    m_myElem = new Trekking;
}

void MyContext::initMyContext(QQmlApplicationEngine &engine, QQmlContext *myContext)
{
    m_myContext = myContext;

    QString initialUrl = QStringLiteral("www.google.com");

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

    if (nomAction == "set Folders Url")
    {
//        m_myElem->setOriginalUrl(truncateUrl(parameter));
//        m_myElem->setTargetUrl(truncateUrl(parameter2));

        qDebug() << "Urls were set";
    }

    if (nomAction == "Create Copy Folder")
    {
//        m_myElem->setOriginalString(parameter);
//        m_myElem->setReplacementString(parameter2);

//        qDebug() << m_myElem->getOriginalUrl();
//        qDebug() << m_myElem->getTargetUrl();
//        qDebug() << m_myElem->getOriginalString();
//        qDebug() << m_myElem->getReplacementString();
//        m_myElem->copyOriginalFolder();

    }

//    if (nomAction == "")
//    {

//    }
}

QString MyContext::truncateUrl(const QString &url)
{
    QString truncated = url;
    return truncated.remove(0, 8);
}

