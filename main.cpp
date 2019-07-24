 #include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QObject>
#include <QQuickItem>
#include <QtGlobal>
#include <QString>
#include <QDebug>
#include <QCoreApplication>
#include <QSize>
#include <QScreen>
#include "engine.h"
#include "memory.h"
#include "memorylist.h"




int main(int argc, char *argv[])
{


    //QGuiApplication app(argc, argv);
    //app.size();
    QApplication app (argc, argv);



    //Load Memory Class to QML
    qmlRegisterType<Memory>("io.qt.MoodApp.memory", 1, 0, "Memory");
    qmlRegisterType<MemoryList>("io.qt.MoodApp.memorylist", 1, 0, "MemoryList");
    qmlRegisterType<Engine>("io.qt.MoodApp.engine", 1, 0, "Engine");

    //Load QML File
    QQmlApplicationEngine engineMemory;
  //  QUrl resourceUrl(QStringLiteral("qrc:/HomeForm.qml"));
  //      qmlRegisterSingletonType(resourceUrl, "my.customermodel.singleton", 1, 0, "CustomerModel");
   // engineMemory.
    engineMemory.load(QUrl(QStringLiteral("qrc:/InputOneEvent.qml")));






  //   Engine::getdisplaySize(&app);



//    QQmlComponent componentMemory(&engineMemory,
//                                  QUrl::fromLocalFile("qrc:/HomeForm.ui.qml"));




    //the output from Compiler generation is starting down there. Its the load of your DataBase. So there should be nothing untill you safe a Document.
    //PS: its just debugging the title
    //if you want to load an MemoryList in Cpp, but I fond a way to do this in QML, its much more easy
    //its a bit like JavaScript in Qml, and its also near to java.
/*
    //Load all Memorys from XML Files (static function on Memory)
    MemoryList memoryListObject;
    //cause of QML the Qlist is useless in the Constructor. So we need a Method to load the List from Data
    memoryListObject.setLoad("");
    QList<Memory*> memoryList = memoryListObject.getListofAllMemorys();
    QList<Memory*>::iterator i;
    for (i = memoryList.begin(); i != memoryList.end(); ++i) {
        qDebug() << i.operator*()->getTitle() << endl;
         //engineMemory.rootContext().setContextProperty("Memory",&m );}*/

    return app.exec();
}
