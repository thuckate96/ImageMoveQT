#include "imagechange.h"
#include <QObject>
#include <QUrl>
ImageChange::ImageChange(QObject *parent) : QObject(parent){
    number = 0;
    sourceImg = "images/canhcut.jpg";
}

void ImageChange::setSourceImage(QString sourceImg){
    this->sourceImg = sourceImg;
    emit sourceImageChanged();
}

void ImageChange::changedImage(){
    QString listImg[3] = {"images/canhcut.jpg", "images/cumeo.jpg", "images/meo.jpg"};
    number++;
    if(number > 2) number = 0;
    setSourceImage(listImg[number]);

//    setSourceImage("images/cumeo.jpg");

}
