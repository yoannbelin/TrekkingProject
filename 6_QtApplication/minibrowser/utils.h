#ifndef UTILS_H
#define UTILS_H

#include <QObject>
#include <QtCore/QUrl>

class Utils : public QObject {
    Q_OBJECT
public:
    Utils(QObject* parent = 0) : QObject(parent) { }
    Q_INVOKABLE static QUrl fromUserInput(const QString& userInput);
};

#endif // UTILS_H
