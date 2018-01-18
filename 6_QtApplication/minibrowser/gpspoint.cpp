#include "gpspoint.h"

GpsPoint::GpsPoint(QObject *parent) : QObject(parent)
{
    m_latitude = 0.0;
    m_longitude = 0.0;
}

GpsPoint::GpsPoint(const float &latitude, const float &longtitude, QObject *parent):
    m_latitude(latitude), m_longitude(longtitude), QObject(parent)
{
    roundCoordinates();
    qDebug() << "GpsPoint constructor with arguments invoked";
}

GpsPoint::GpsPoint(const GpsPoint &aGpsPoint)
{
    m_latitude = aGpsPoint.m_latitude;
    m_longitude = aGpsPoint.m_longitude;
    roundCoordinates();
}

bool GpsPoint::userMoved(const GpsPoint &previousGpsPoint)
{
    bool differentPoint = !(m_latitude == previousGpsPoint.m_latitude &&
                            m_longitude == previousGpsPoint.m_longitude);

    return differentPoint;
}

void GpsPoint::roundCoordinates()
{
    setLatitude(roundFloat(m_latitude));
    setLongitude(roundFloat(m_longitude));
}

float GpsPoint::roundFloat(float &number)
{
    float tmp = (round(number * 20000) / 20000);
    qDebug() <<  tmp;
    return ( round(number * 20000) / 20000);
}
