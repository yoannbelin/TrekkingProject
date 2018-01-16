#ifndef GPSPOINT_H
#define GPSPOINT_H

#include <QObject>
#include <QDebug>

class GpsPoint : public QObject
{
    Q_OBJECT

    Q_PROPERTY(float latitude READ getLatitude WRITE setLatitude NOTIFY latitudeChanged)
    Q_PROPERTY(float longitude READ getLongitude WRITE setLongitude NOTIFY longitudeChanged)
    Q_PROPERTY(float altitude READ getAltitude WRITE setAltitude NOTIFY altitudeChanged)

    float m_latitude;
    float m_longitude;
    float m_altitude;

public:
    explicit GpsPoint(QObject *parent = nullptr);
    GpsPoint (const float &latitude, const float &longtitude, const float &altitude, QObject *parent = nullptr);
    GpsPoint (const GpsPoint &aGpsPoint);

    bool userMoved(const GpsPoint &previousGpsPoint);
    void roundCoordinates();
    float roundFloat (const float &number);

    float getLatitude() const
    {
        return m_latitude;
    }

    float getLongitude() const
    {
        return m_longitude;
    }

    float getAltitude() const
    {
        return m_altitude;
    }

signals:

    void latitudeChanged(float latitude);

    void longitudeChanged(float longitude);

    void altitudeChanged(float altitude);

public slots:
void setLatitude(float latitude)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_latitude, latitude))
        return;

    m_latitude = latitude;
    emit latitudeChanged(m_latitude);
}
void setLongitude(float longitude)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_longitude, longitude))
        return;

    m_longitude = longitude;
    emit longitudeChanged(m_longitude);
}
void setAltitude(float altitude)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_altitude, altitude))
        return;

    m_altitude = altitude;
    emit altitudeChanged(m_altitude);
}
};

#endif // GPSPOINT_H
