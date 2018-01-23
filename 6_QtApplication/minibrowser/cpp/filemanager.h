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
    }

signals:

    void pathwayChanged(QString pathway);

public slots:

    void setPathway(QString pathway)
    {
        if (m_pathway == pathway)
            return;

        m_pathway = pathway;
        emit pathwayChanged(m_pathway);
    }
};

#endif // FILEMANAGER_H
