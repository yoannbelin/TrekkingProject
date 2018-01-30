#ifndef GPSPOINT_H
#define GPSPOINT_H

#include <QObject>
#include <QDebug>

class GpsPoint : public QObject
{
    Q_OBJECT

    Q_PROPERTY(double latitude READ getLatitude WRITE setLatitude NOTIFY latitudeChanged)
    Q_PROPERTY(double longitude READ getLongitude WRITE setLongitude NOTIFY longitudeChanged)

    double m_latitude;
    double m_longitude;

public:
    explicit GpsPoint(QObject *parent = nullptr);
    GpsPoint (const double &latitude, const double &longtitude, QObject *parent = nullptr);
    GpsPoint (const GpsPoint &aGpsPoint);
//    ~GpsPoint();

    GpsPoint& operator =(GpsPoint const &a)
    {
        this->setLatitude (a.m_latitude);
        this->setLongitude(a.m_longitude);
        return *this;
    }

    bool userMoved(const GpsPoint &previousGpsPoint);
    void roundCoordinates();
    double roundFloat (double &number);

    double getLatitude() const
    {
        return m_latitude;
    }

    double getLongitude() const
    {
        return m_longitude;
    }

signals:

    void latitudeChanged(double latitude);
    void longitudeChanged(double longitude);

public slots:
    void setLatitude(double latitude)
    {
        if (qFuzzyCompare(m_latitude, latitude))
            return;

        m_latitude = latitude;
        emit latitudeChanged(m_latitude);
    }
    void setLongitude(double longitude)
    {
        if (qFuzzyCompare(m_longitude, longitude))
            return;

        m_longitude = longitude;
        emit longitudeChanged(m_longitude);
    }
};

#endif // GPSPOINT_H
