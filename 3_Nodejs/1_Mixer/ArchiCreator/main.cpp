#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "elementcreator.h"
#include "mycontext.h"
#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext* ctx = engine.rootContext();
    MyContext myContext;

    // Set le ctx
    myContext.setMyContext( ctx );

    // Update le ctx
    myContext.loadMyContext();

    // Ouvrir le Qml
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;


    return app.exec();
}
