#ifndef ELEMENTCREATOR_H
#define ELEMENTCREATOR_H

#include <QObject>
#include <QDir>
#include <QFile>
#include <QString>
#include <QDebug>
#include <QTextStream>

class ElementCreator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString originalUrl READ getOriginalUrl WRITE setOriginalUrl NOTIFY originalUrlChanged)
    Q_PROPERTY(QString targetUrl READ getTargetUrl WRITE setTargetUrl NOTIFY targetUrlChanged)
    Q_PROPERTY(QString originalString READ getOriginalString WRITE setOriginalString NOTIFY originalStringChanged)
    Q_PROPERTY(QString replacementString READ getReplacementString WRITE setReplacementString NOTIFY replacementStringChanged)

    void createFolderCopy(const QString &originalUrl, const QString &targetUrl);
    void createFileCopy(const QString &originalFilePath, const QString &newFilePath);

    QStringList replaceOriginalStrings(const QStringList &textSample);
    QString replaceOriginalString(const QString &stringSample);

    QString convertToStringStartingWithUpperCase (const QString &stringStartingWithLowerCase);

    QString m_originalUrl;
    QString m_targetUrl;
    QString m_originalString;
    QString m_replacementString;

public:
    explicit ElementCreator(QObject *parent = nullptr);

    ElementCreator(const QString &originalUrl ,const QString &targetUrl ,const QString &originalString ,const QString &replacementString ,QObject *parent = 0);

     void copyOriginalFolder();


QString getOriginalUrl() const
{
    return m_originalUrl;
}

QString getTargetUrl() const
{
    return m_targetUrl;
}

QString getOriginalString() const
{
    return m_originalString;
}

QString getReplacementString() const
{
    return m_replacementString;
}

signals:

void originalUrlChanged(QString originalUrl);

void targetUrlChanged(QString targetUrl);

void originalStringChanged(QString originalString);

void replacementStringChanged(QString replacementString);

public slots:

void setOriginalUrl(QString originalUrl)
{
    if (m_originalUrl == originalUrl)
        return;

    m_originalUrl = originalUrl;
    emit originalUrlChanged(m_originalUrl);
}
void setTargetUrl(QString targetUrl)
{
    if (m_targetUrl == targetUrl)
        return;

    m_targetUrl = targetUrl;
    emit targetUrlChanged(m_targetUrl);
}
void setOriginalString(QString originalString)
{
    if (m_originalString == originalString)
        return;

    m_originalString = originalString;
    emit originalStringChanged(m_originalString);
}
void setReplacementString(QString replacementString)
{
    if (m_replacementString == replacementString)
        return;

    m_replacementString = replacementString;
    emit replacementStringChanged(m_replacementString);
}
};

#endif // ELEMENTCREATOR_H
