#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QThread>
#include <QtQml>
#include "src/imagechange.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<ImageChange>("imageChange", 1, 0, "ImageChange");
    qmlRegisterType<QTimer>("myTimer", 1, 0, "QTimer");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
