#ifndef memory_h
#define memory_h
#include <QObject>
#include <QString>
#include <QFile>
#include <QList>
//#include <QQmlListProperty>

class Memory : public QObject
{
    // with this properts Qml and cpp are getting one -> so when you  say to a QML object nameOfMemoryObject.title = "some fancy new Title"
    // and later ask in an TextArea for : TextArea {text : nameOfMemoryObject.title} , you get the Text :"some fancy new Title"
    // and thats because of this propertys. so nice! You give the QML Object only the getter/setter and some signal-(know body knows why?)
    Q_OBJECT
    Q_PROPERTY(QString title READ getTitle WRITE setTitle NOTIFY titleChanged)
    Q_PROPERTY(QString art READ getArt WRITE setArt NOTIFY artChanged)
    Q_PROPERTY(QString text READ getText WRITE setText NOTIFY textChanged)
    Q_PROPERTY(QString ownPart READ getOwnPart WRITE setOwnPart )
    Q_PROPERTY(QString intensity READ getIntensity WRITE setIntensity)
    Q_PROPERTY(QString save READ getSave WRITE saveFile NOTIFY fileSaved)


public:
    Memory(QObject *parent = nullptr);
    Memory (const Memory& origin);
    QString getTitle();
    QString getArt();
    QString getText();
    QString getOwnPart();
    QString getSave();
    int getIntensity();
    int getRating() const;

    void setArt(QString art);
    void saveFile(QString input);
    void setText(QString text);
    void setTitle(QString title);
    void setOwnPart(QString value);
    void setIntensity(QString value);



    void setRating(int value);

signals:

    void textChanged();
    void titleChanged();
    void artChanged();
    void fileSaved();

private:
    QString title;
    QString art;
    QString text;
    QString ownPart;
    int intensity;
    QString save;
    int rating;

};

#endif // memory_h
