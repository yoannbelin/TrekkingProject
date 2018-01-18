#include "gpspoint.h"

GpsPoint::GpsPoint(QObject *parent) : QObject(parent)
{
    m_latitude = 0.0;
    m_longitude = 0.0;
}

GpsPoint::GpsPoint(const double &latitude, const double &longtitude, QObject *parent):
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

double GpsPoint::roundFloat(double &number)
{
    double tmp = (round(number * 20000) / 20000);
    qDebug() <<  tmp;
    return tmp;

//    qDebug() << number;

//    double tmp = round(number * 10000) / 10000;

//    if (number - tmp > 0) {
//        number = tmp + 0.00005;
//    }

//    else {
//        number = tmp;
//    }

//    return number;
}
