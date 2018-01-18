#ifndef GPSPOINT_H
#define GPSPOINT_H

#include <QObject>
#include <QDebug>

class GpsPoint : public QObject
{
    Q_OBJECT

    Q_PROPERTY(float latitude READ getLatitude WRITE setLatitude NOTIFY latitudeChanged)
    Q_PROPERTY(float longitude READ getLongitude WRITE setLongitude NOTIFY longitudeChanged)

    float m_latitude;
    float m_longitude;

public:
    explicit GpsPoint(QObject *parent = nullptr);
    GpsPoint (const float &latitude, const float &longtitude, QObject *parent = nullptr);
    GpsPoint (const GpsPoint &aGpsPoint);

    bool userMoved(const GpsPoint &previousGpsPoint);
    void roundCoordinates();
    float roundFloat (float &number);

    float getLatitude() const
    {
        return m_latitude;
    }

    float getLongitude() const
    {
        return m_longitude;
    }

signals:

    void latitudeChanged(float latitude);
    void longitudeChanged(float longitude);

public slots:
    void setLatitude(float latitude)
    {
        if (qFuzzyCompare(m_latitude, latitude))
            return;

        m_latitude = latitude;
        emit latitudeChanged(m_latitude);
    }
    void setLongitude(float longitude)
    {
        if (qFuzzyCompare(m_longitude, longitude))
            return;

        m_longitude = longitude;
        emit longitudeChanged(m_longitude);
    }
};

#endif // GPSPOINT_H
