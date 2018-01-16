#include "gpspoint.h"

GpsPoint::GpsPoint(QObject *parent) : QObject(parent)
{
    m_latitude = 0.0;
    m_longitude = 0.0;
    m_altitude = 0.0;
}

GpsPoint::GpsPoint(const float &latitude, const float &longtitude, const float &altitude, QObject *parent):
    m_latitude(latitude), m_longitude(longtitude), m_altitude(altitude), QObject(parent)
{
    roundCoordinates();
    qDebug() << "GpsPoint constructor with arguments invoked";
}

GpsPoint::GpsPoint(const GpsPoint &aGpsPoint)
{
    m_latitude = aGpsPoint.m_latitude;
    m_longitude = aGpsPoint.m_longitude;
    m_altitude = aGpsPoint.m_altitude;
}

bool GpsPoint::userMoved(const GpsPoint &previousGpsPoint)
{
    bool differentPoint = !(m_latitude == previousGpsPoint.m_latitude &&
                            m_longitude == previousGpsPoint.m_longitude &&
                            m_altitude == previousGpsPoint.m_altitude);

    return differentPoint;
}

void GpsPoint::roundCoordinates()
{
    m_latitude = roundFloat(m_latitude);
    m_longitude = roundFloat(m_longitude);
    m_altitude = roundFloat(m_altitude);
}

float GpsPoint::roundFloat(const float &number)
{
    float roundedNumber = number;

    roundedNumber = round(roundedNumber * 10000) /10000;
    if( number - roundedNumber > 0)
    {
        roundedNumber = roundedNumber + 0.00005;
    }

    return roundedNumber;
}
