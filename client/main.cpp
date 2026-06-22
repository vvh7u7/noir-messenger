#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include <QCoreApplication>

#include <ThemeEngine/ThemeManager.hpp>

using namespace ThemeEngine;

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    Q_INIT_RESOURCE(haqml_resources);
    //Q_INIT_RESOURCE(resources);
    Q_INIT_RESOURCE(themes);
    QQmlApplicationEngine engine;

    //Для переопределения HaQml ресурсов
    ThemeEngine::ThemeManager::instance()->setAppResourcePrefix(":/noir"); //":/app" - Писать название префикса в .qrc файле.

    auto* manager = ThemeManager::instance();
    if (!manager->loadTheme(":/noir/assets/themes/Dark.json")) {
        qWarning() << "[Main] Failed to pre-load embedded Dark.json from resources!";
    }
    qmlRegisterSingletonType<ThemeManager>("ThemeEngine", 1, 0, "Theme",
        [](QQmlEngine*, QJSEngine*) -> QObject* {
            return ThemeManager::instance();
        }
    );

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() {
            QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.load(QUrl(QStringLiteral("qrc:/qml/Main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
