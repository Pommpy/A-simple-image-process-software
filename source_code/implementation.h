#ifndef IMPLEMENTATION_H
#define IMPLEMENTATION_H

#include <QObject>
#include <QQuickItem>

class implementation : public QObject
{
    Q_OBJECT
public:
    explicit implementation(QObject *parent = nullptr);

    void SetBrightnessAndContrast(QString input, int Brightness, int Contrast);

signals:

public slots:
};

#endif // IMPLEMENTATION_H
