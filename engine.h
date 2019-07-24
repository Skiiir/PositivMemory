#ifndef ENGINE_H
#define ENGINE_H
#include <QObject>
#include <QSize>
#include <QApplication>

class Engine: public QObject
{
    Q_OBJECT
    Q_PROPERTY(int displayWidth READ getDisplayWidth WRITE setDisplayWidth )
    Q_PROPERTY(int displayHeight READ getDisplayHeight WRITE setDisplayHeight )
    Q_PROPERTY(QString file READ getFile )
public:

      Engine(QObject *parent = nullptr);
      Engine (const Engine& origin);
      QSize getdisplaySize();







     int getDisplayHeight();

     void setDisplayHeight(int value);
     QString getFile();
     int getDisplayWidth();
     void setDisplayWidth(int value);

private:
     QSize displaySize;
      int displayWidth;
      int displayHeight;
      QString file;

};



#endif // ENGINE_H
