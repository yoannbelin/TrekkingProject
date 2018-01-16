#include "trek.h"

Trek::Trek(QObject *parent) : QObject(parent)
{
    m_label = "trek_name";
    m_length = "1";
    m_time = "00:00:00";
//    m_path = [];
//    m_trace = [];
    m_level = "1";
    m_done = 1;

}

Trek::Trek(const QString &label, QObject *parent): m_label(label), QObject(parent)
{
    m_length = "1";
    m_time = "00:00:00";
//    m_path = [];
    m_level = "1";
    m_done = 1;
}

Trek::Trek(const Trek &old_trek, QObject *parent): QObject(parent)
{
    m_label = old_trek.m_label;
    m_length = old_trek.m_length;
    m_time = old_trek.m_time;
//    m_path = [];
    m_trace = old_trek.m_trace;
    m_level = old_trek.m_level;
    m_done = 1;
}

void Trek::addNewGpsPoint(GpsPoint newGpsPoint)
{
    bool moving = didUserMove(newGpsPoint);

    if (moving)
    {
        m_path.push_back(new GpsPoint(newGpsPoint));
    }

    else
    {
        qDebug() << "User is not moving";
    }
}

bool Trek::didUserMove(GpsPoint &newGpsPoint)
{
    return newGpsPoint.userMoved(m_path.back());
}

