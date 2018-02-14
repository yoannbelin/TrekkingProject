#include "utils.h"

//Utils::Utils(QObject *parent) : QObject(parent)
//{

//}

QUrl Utils::fromUserInput(const QString& userInput)
{
    if (userInput.isEmpty())
        return QUrl::fromUserInput("about:blank");
    const QUrl result = QUrl::fromUserInput(userInput);
    return result.isValid() ? result : QUrl::fromUserInput("about:blank");
}
