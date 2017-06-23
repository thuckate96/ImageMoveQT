#include "imagechange.h"
#include <QObject>
#include <QUrl>
ImageChange::ImageChange(QObject *parent) : QObject(parent){
    number = 0;
    sourceImg = "images/11.jpg";
}

void ImageChange::setSourceImage(QString sourceImg){
    this->sourceImg = sourceImg;
    emit sourceImageChanged();
}

void ImageChange::changedImage(){
    QString listImg[2] = { "images/12.jpg", "images/13.jpg"};
    number++;
    if(number > 1) number = 0;
    setSourceImage(listImg[number]);
}
