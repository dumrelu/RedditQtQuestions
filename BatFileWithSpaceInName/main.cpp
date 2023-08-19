#include <QCoreApplication>
#include <QString>
#include <QProcess>
#include <QDebug>
#include <QDir>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QDir::setCurrent(QStringLiteral("c:/temp/"));

    QString commstr = "C:\\temp\\c path.bat";
    QProcess::startDetached("cmd.exe", QStringList() << "/c" << "start"  << "" << commstr);

//    QProcess::startDetached("cmd.exe /c start \"C:\\temp\\c path.bat\"");
//    qDebug() << "cmd.exe /c start \"C:\\temp\\c path.bat\"";

//    QProcess process;
//    auto Command = QString("cmd.exe");
//    auto Arguments = QStringList{
//            QString("/C"),
//            QString("start"),
//            "",
//            commstr
//    };

//    process.setProgram(Command);
//    process.setArguments(Arguments);
//    qDebug() << process.program();
//    qDebug() << process.arguments();

//    process.start();

//    //process.start(Command, Arguments);
//    process.waitForFinished(-1);

//    qDebug() << process.readAllStandardOutput();
//    qDebug() << process.readAll();

    return a.exec();
}
