#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "balancelist.h"
#include "changecurrencylist.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    BalanceList model;

    qmlRegisterType<BalanceList> ("Balance", 1, 0, "BalanceListModel");
    qmlRegisterType<ChangeCurrencyList> ("ChangeCurrency", 1, 0, "ChangeCurrencyListModel");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
