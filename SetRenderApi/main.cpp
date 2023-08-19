#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQuickWindow>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQuickWindow::setGraphicsApi(QSGRendererInterface::OpenGL);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url,&engine](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);

        auto* window = qobject_cast<QQuickWindow*>(engine.rootObjects()[0]);
        qDebug() << "Render interface" << window->rendererInterface()->graphicsApi();

    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
