#ifndef PHOTOEDIT_H
#define PHOTOEDIT_H
#include <QObject>
#include <QQuickItem>
using namespace std;


class PhotoEdit : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int CurrentBrightness READ getCurrentBrightness WRITE setCurrentBrightness)
    Q_PROPERTY(int CurrentContrast READ getCurrentContrast WRITE setCurrentContrast)
    Q_PROPERTY(int CurrentHue READ getCurrentHue WRITE setCurrentHue)
    Q_PROPERTY(int CurrentSaturation READ getCurrentSaturation WRITE setCurrentSaturation)
    Q_PROPERTY(int CurrentValue READ getCurrentValue WRITE setCurrentValue)
public:
    explicit PhotoEdit(QObject *parent = nullptr);
    Q_INVOKABLE void save(QString input, QString location, QString name);
    Q_INVOKABLE QString putText(QString input, QString text, int x, int y, int size, int B, int G, int R);
    Q_INVOKABLE QString rotate(QString input, int type);
    Q_INVOKABLE QString getSource();
    Q_INVOKABLE QString cut(QString input, int x, int y, int a, int b);
    Q_INVOKABLE QString setExposure(QString input, int alpha);
    Q_INVOKABLE QString edit(QString input);
    Q_INVOKABLE QString filter(QString input,int a);
    Q_INVOKABLE QString req(QString input, int b);
    Q_INVOKABLE QString init(QString input);
    Q_INVOKABLE QString reset();
    Q_INVOKABLE QString showMagnitude(QString input);
    Q_INVOKABLE QString gauss(QString input, int type);
    Q_INVOKABLE QString recover(QString input, int type);
    Q_INVOKABLE void setCurrentValue(int x);
    Q_INVOKABLE void setCurrentBrightness(int x);
    Q_INVOKABLE void setCurrentContrast(int x);
    Q_INVOKABLE void setCurrentHue(int x);
    Q_INVOKABLE void setCurrentSaturation(int x);
    Q_INVOKABLE int getCurrentBrightness();
    Q_INVOKABLE int getCurrentContrast();
    Q_INVOKABLE int getCurrentHue();
    Q_INVOKABLE int getCurrentSaturation();
    Q_INVOKABLE int getCurrentValue();
    int CurrentBrightness = 0, CurrentContrast = 0, CurrentHue = 255, CurrentSaturation = 255, CurrentValue = 255;
signals:

public slots:
};

#endif // PHOTOEDIT_H
