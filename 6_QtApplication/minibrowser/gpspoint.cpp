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
    m_latitude = roundFloat(m_latitude);
    m_longitude = roundFloat(m_longitude);
}

float GpsPoint::roundFloat(float &number)
{
//    float roundedNumber = number;

//    roundedNumber = round(roundedNumber * 10000) /10000;
//    if( number - roundedNumber > 0)
//    {
//        roundedNumber = roundedNumber + 0.00005;
//    }

//    return roundedNumber;

    return (round(number * 20000) / 20000);
}
