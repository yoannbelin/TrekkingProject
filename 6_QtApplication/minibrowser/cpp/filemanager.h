#ifndef FILEMANAGER_H
#define FILEMANAGER_H

#include <QStringList>
#include <iostream>
#include <QString>
#include <QDir>
#include <QFile>
#include <QDebug>
#include <QTextStream>
#include <QStandardPaths>
#include <QObject>

<<<<<<< HEAD
<<<<<<< HEAD
class FileManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString pathway READ getPathway WRITE setPathway NOTIFY pathwayChanged)

    QString m_pathway;
    void setLinesInFile(const QString &ligne);

public:
    explicit FileManager(QObject *parent = nullptr);

    void init();
    void saveIntoTxtFile(double lat, double lng); //new

    QString getPathway() const
    {
        return m_pathway;
=======
=======
>>>>>>> master

class FileManager : public QObject
{
    Q_OBJECT

    QString m_basePath;

public:
    explicit FileManager ( QObject *parent = nullptr );

    void initFolder();
    bool fileExists( const QString &fileType, const QString &fileName );
    QStringList loadFile( const QString &fileType, const QString &fileName );
    void addLine( const QString &fileType, const QString &fileName, const QString &dataLine );
    void updateFile( const QString &fileType, const QString &fileName, const QStringList &data );
    void deleteFile( const QString &fileType, const QString &fileName );


    QString getBasePath() const
    {
        return m_basePath;
    }
    void setBasePath( const QString &basePath )
    {
        m_basePath = basePath;
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
    }

signals:

<<<<<<< HEAD
<<<<<<< HEAD
    void pathwayChanged(QString pathway);

public slots:

    void setPathway(QString pathway)
    {
        if (m_pathway == pathway)
            return;

        m_pathway = pathway;
        emit pathwayChanged(m_pathway);
    }
=======
=======
>>>>>>> master

public slots:


<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
};

#endif // FILEMANAGER_H
