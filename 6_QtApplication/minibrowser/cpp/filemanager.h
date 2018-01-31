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


class FileManager : public QObject
{
    Q_OBJECT

    QString m_filename;
    QString m_filetype;
    QString m_basePath;

    QString fileUrl();

public:
    explicit FileManager (QObject *parent = nullptr);
    FileManager (const QString &filetype, const QString &filename, QObject *parent = nullptr);

    void init();
    bool searchFile();
    QStringList loadFile();
    void addLine(const QString &dataLine);
    void updateFile(const QStringList &data);
    void deleteFile();


    QString getFilename() const
    {
        return m_filename;
    }
    void setFilename(const QString &filename)
    {
        m_filename = filename;
    }

    QString getFiletype() const
    {
        return m_filetype;
    }
    void setFiletype(const QString &filetype)
    {
        m_filetype = filetype;
    }

    QString getBasePath() const
    {
        return m_basePath;
    }
    void setBasePath(const QString &basePath)
    {
        m_basePath = basePath;
    }

signals:


public slots:


};

#endif // FILEMANAGER_H
