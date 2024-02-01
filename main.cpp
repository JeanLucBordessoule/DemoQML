#include <QGuiApplication>
#include <QQmlApplicationEngine>

// QQuickStyle defines the aspect of the GUI (requires: QuickControls2 Qt6::QuickControls2)
#include <QtQuickControls2/QQuickStyle>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Material"); // "Basic" "Fusion" ...

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("DemoQML", "Main");

    return app.exec();
}
