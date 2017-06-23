#ifndef IMAGECHANGE_H
#define IMAGECHANGE_H
#include <QObject>
class ImageChange : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString sourceImage READ sourceImage WRITE setSourceImage NOTIFY sourceImageChanged)
public:
    explicit ImageChange(QObject* parent = 0);
    QString sourceImage(){return sourceImg;}
    void setSourceImage(QString sourceImg);
signals:
    void sourceImageChanged();
public slots :
    void changedImage();
private:
    QString sourceImg;
    int number;
};
#endif // IMAGECHANGE_H
