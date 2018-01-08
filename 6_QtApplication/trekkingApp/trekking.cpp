#include "Trekking.h"
Trekking::Trekking(QObject *parent) : QObject(parent) {}

Trekking::Trekking( const QString &originalUrl, const QString &targetUrl, const QString &originalString,
                                const QString &replacementString, QObject *parent):
                                m_originalUrl(originalUrl), m_targetUrl(targetUrl),
                                m_originalString(originalString), m_replacementString(replacementString), QObject(parent)
{}

void Trekking::copyOriginalFolder()
{
    QFileInfo originalFolder(m_originalUrl);

    if (originalFolder.isDir())
    {
        createFolderCopy(m_originalUrl, m_targetUrl);
        qDebug() << "Creating new folder:" << m_targetUrl << "based on" << m_originalUrl << "\'s content";
    }

    else
    {
        qDebug() << "Incorrect folder path";
    }

}

void Trekking::createFolderCopy(const QString &originalUrl, const QString &targetUrl)
{
    QDir sourceFolder(originalUrl);
    QDir newFolder(targetUrl);

    if (!newFolder.exists())
    {
        newFolder.mkdir(targetUrl);
        qDebug() << "Created folder" << targetUrl;
    }

    QStringList fileNames = sourceFolder.entryList(QDir::Files | QDir::Dirs | QDir::NoDotAndDotDot | QDir::Hidden | QDir::System);

    foreach (const QString &fileName, fileNames)
    {
        const QString newSourcePath = originalUrl + QLatin1Char('/') + fileName;
        // So that newFileNames change for each element created, thus avoiding accidental erasing of files created from the same original document.
        QString newFileName = replaceOriginalString(fileName);
        const QString newTargetUrl = targetUrl + QLatin1Char('/') + newFileName;

        QFileInfo fileType(newSourcePath);

        if (fileType.isDir())
        {
            createFolderCopy(newSourcePath, newTargetUrl);
        }

        else if (fileType.isFile())
        {
            createFileCopy(newSourcePath, newTargetUrl);
        }

        else
        {
            qDebug() << "File Type undefined";
        }
    }

    qDebug() << originalUrl << "folder has fully been copied.";
}

void Trekking::createFileCopy(const QString &originalFilePath, const QString &newFilePath)
{

    QFile originalFile(originalFilePath);
    QFile newFile(newFilePath);

    QString wholeFile;

    if (originalFile.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        QTextStream outstream(&originalFile);

        wholeFile = outstream.readAll();

        if (newFile.open(QIODevice::WriteOnly | QIODevice::Text))
        {
            wholeFile = replaceOriginalString( wholeFile );

            QTextStream in(&newFile);

            in << wholeFile;

            qDebug() << originalFilePath << "\'s copy -" << newFilePath << "- was successfully created.";
            newFile.close();
        }

        else
        {
            qDebug() << "Could not open" << newFilePath << "for writing.";
        }
    }

    else
    {
        qDebug() << "Could not open" << newFilePath << "for writing.";
    }

}

QStringList Trekking::replaceOriginalStrings(const QStringList &textSample)
{
    QStringList copy = textSample;
    copy.replaceInStrings(m_originalString, m_replacementString, Qt::CaseSensitive);

    // Allows to replace UpperCasing starting words as well.
    QString upperOriginalString = convertToStringStartingWithUpperCase(getOriginalString());
    QString upperReplacementString = convertToStringStartingWithUpperCase(getReplacementString());

    copy.replaceInStrings(upperOriginalString, upperReplacementString, Qt::CaseSensitive);

    return copy;
}

QString Trekking::replaceOriginalString(const QString &stringSample)
{
    QString copy = stringSample;
    copy.replace(m_originalString, m_replacementString);

    // Allows to replace UpperCasing starting words as well.
    QString upperOriginalString = convertToStringStartingWithUpperCase(getOriginalString());
    QString upperReplacementString = convertToStringStartingWithUpperCase(getReplacementString());

    copy.replace(upperOriginalString, upperReplacementString, Qt::CaseSensitive);

    return copy;
}

QString Trekking::convertToStringStartingWithUpperCase(const QString &stringStartingWithLowerCase)
{
    QString original = stringStartingWithLowerCase;
    QString newString = original.replace(0, 1, original[0].toUpper());
    return newString;
}

