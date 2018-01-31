#include "filemanager.h"


FileManager::FileManager(QObject *parent) : QObject(parent)
{
    init();
}

FileManager::FileManager(const QString &filetype, const QString &filename, QObject *parent):
    m_filetype(filetype), m_filename(filename), QObject(parent)
{
    init();
}

void FileManager::init()
{
    // verif dossier de sauvegarde.exists() et cree au cas ou
    QString _basePath = QStandardPaths::standardLocations(QStandardPaths::AppLocalDataLocation)[0];
    qDebug() << "#" << _basePath;

    QDir dir(_basePath);
    QDir storage(_basePath + "/storage");

    if (!storage.exists())
    {
        qDebug() << "no directory";
        dir.mkdir("storage");
    }
    setBasePath(_basePath + "/storage/");
    qDebug() << getBasePath();
}

QString FileManager::fileUrl()
{
    return (getBasePath() + getFiletype() + "_" + getFilename());
}

bool FileManager::searchFile()
{
//    QFile storedFile(fileUrl());
//    return storedFile.exists();
    QStringList data = loadFile();
    return data.isEmpty();
}

QStringList FileManager::loadFile()
{
    QStringList data;
    //    QString lineOfData;
    QFile storedFile(fileUrl());

    if (!storedFile.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        qDebug() << "cannot open file:" << fileUrl();
    }
    else
    {
        QTextStream readingStream(&storedFile);
        readingStream.setCodec("UTF-8");
        while (!readingStream.atEnd())
        {
            data << readingStream.readLine();
        }
        storedFile.close();
    }
    return data;
}

void FileManager::addLine(const QString &dataLine)
{
    QFile fileToUpdate (fileUrl());
    if (!fileToUpdate.open(QIODevice::WriteOnly | QIODevice::Text | QIODevice::Append)) {
        qDebug() << "Ouverture Impossible" << fileUrl() << "n'a pas pu être ouvert";
    }

    else {
        QTextStream writeStream( &fileToUpdate );
        writeStream.setCodec("UTF-8");
        writeStream << endl << dataLine;

        qDebug() << "Saved Line in :" << fileUrl();
    }
}

void FileManager::updateFile(const QStringList &data)
{
    QFile fileToUpdate (fileUrl());
    if (!fileToUpdate.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qDebug() << "Ouverture Impossible" << fileUrl() << "n'a pas pu être ouvert";
    }

    else {
        QTextStream writeStream( &fileToUpdate );
        writeStream.setCodec("UTF-8");

        for (QString dataLine : data)
        {
            writeStream << dataLine << endl;
        }

        qDebug() << "Saved Line in :" << fileUrl();
    }
}

void FileManager::deleteFile()
{
    QFile fileToDelete (fileUrl());
    if(fileToDelete.remove())
    {
        qDebug() << fileUrl() + " was deleted";
    };
}



//void FileManager::saveIntoTxtFile(double lat, double lng)
//{
//    if (! isnan(lat) && ! isnan(lng)) {


//        QString latLng = "{\"lat\":";
//        latLng += QString::number(lat);
//        latLng += ",\"lng\":";
//        latLng += QString::number(lng);
//        latLng += "},";

//        setLinesInFile(latLng);

//        QString txt = getPathway();
//        txt += "\n point : " + latLng;
//        setPathway(txt);
//    }
//}

//void FileManager::setLinesInFile(const QString &ligne)
//{
//    QString _basePath = QStandardPaths::standardLocations(QStandardPaths::AppLocalDataLocation)[0];
//    qDebug() << "#" << _basePath;


//    QDir dir(_basePath);
//    QDir storage(_basePath + "/storage");

//    if (!storage.exists())
//    {
//        qDebug() << "no directory";
//        dir.mkdir("storage");
//        setPathway("create locale storage");
//    }


//    QString url = _basePath + "/storage/pathway.txt";
//    QFile saveFile(url);

//    if (!saveFile.open(QIODevice::WriteOnly | QIODevice::Text | QIODevice::Append)) {
//        qDebug() << "Ouverture Impossible" << url << "n'a pas pu être ouvert";
//    }

//    else {
//        QTextStream fluxEcriture( &saveFile );
//        fluxEcriture.setCodec("UTF-8");
//        fluxEcriture << ligne;

//        qDebug() << "Save in :" << url;
//    }
//}


//void FileManager::init()
//{
//    QString _basePath = QStandardPaths::standardLocations(QStandardPaths::AppLocalDataLocation)[0];
//    QString url = _basePath + "/storage/pathway.txt";

//    QFile readingFile (url);
//    QString readLine ("old pathway : ");

//    if (readingFile.open(QIODevice::ReadOnly | QIODevice::Text))
//    {
//        QTextStream fluxLecture(&readingFile);
//        while (!fluxLecture.atEnd())
//        {
//            readLine += fluxLecture.readAll();
//        }
//        readingFile.close();

//        readLine += "end of old pathway \n";

//        setPathway(readLine);
//    }

//    else
//    {
//        qDebug() << "Erreur : ouverture du fichier impossible";
//    }
//}
