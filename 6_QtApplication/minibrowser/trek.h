#ifndef TREK_H
#define TREK_H

#include <QObject>
//#include <QString>
#include <QDebug>
#include <gpspoint.h>

class Trek : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString label READ getLabel WRITE setLabel NOTIFY labelChanged)
    Q_PROPERTY(QString length READ getLength WRITE setLength NOTIFY lengthChanged)
    Q_PROPERTY(QString time READ getTime WRITE setTime NOTIFY timeChanged)
    Q_PROPERTY(QList<GpsPoint*> path READ getPath WRITE setPath NOTIFY pathChanged)
    Q_PROPERTY(QList<GpsPoint*> trace READ getTrace WRITE setTrace NOTIFY traceChanged)
    Q_PROPERTY(QString level READ getLevel WRITE setLevel NOTIFY levelChanged)
    Q_PROPERTY(bool done READ getDone WRITE setDone NOTIFY doneChanged)

    QString m_label;
    QString m_length;
    QString m_time;
    QList<GpsPoint*> m_path;
    QList<GpsPoint*> m_trace;
    QString m_level;
    bool m_done;

public:
    explicit Trek(QObject *parent = nullptr);

    Trek(const QString &label, QObject *parent = 0);
    Trek(const Trek &old_trek, QObject *parent = 0);

    void addNewGpsPoint (GpsPoint newGpsPoint);
    bool didUserMove (GpsPoint &newGpsPoint);

    QString getLabel() const
    {
        return m_label;
    }

    QString getLength() const
    {
        return m_length;
    }

    QString getTime() const
    {
        return m_time;
    }

    QList<GpsPoint*> getPath() const
    {
        return m_path;
    }

    QList<GpsPoint*> getTrace() const
    {
        return m_trace;
    }

    QString getLevel() const
    {
        return m_level;
    }

    bool getDone() const
    {
        return m_done;
    }

signals:

    void labelChanged(QString label);
    void lengthChanged(QString length);
    void timeChanged(QString time);
    void pathChanged(QList<GpsPoint*> path);
    void traceChanged(QList<GpsPoint*> trace);
    void levelChanged(QString level);
    void doneChanged(bool done);

public slots:
    void setLabel(QString label)
    {
        if (m_label == label)
            return;

        m_label = label;
        emit labelChanged(m_label);
    }
    void setLength(QString length)
    {
        if (m_length == length)
            return;

        m_length = length;
        emit lengthChanged(m_length);
    }
    void setTime(QString time)
    {
        if (m_time == time)
            return;

        m_time = time;
        emit timeChanged(m_time);
    }
    void setPath(QList<GpsPoint*> path)
    {
        if (m_path == path)
            return;

        m_path = path;
        emit pathChanged(m_path);
    }
    void setTrace(QList<GpsPoint*> trace)
    {
        if (m_trace == trace)
            return;

        m_trace = trace;
        emit traceChanged(m_trace);
    }
    void setLevel(QString level)
    {
        if (m_level == level)
            return;

        m_level = level;
        emit levelChanged(m_level);
    }
    void setDone(bool done)
    {
        if (m_done == done)
            return;

        m_done = done;
        emit doneChanged(m_done);
    }
};

#endif // TREK_H
