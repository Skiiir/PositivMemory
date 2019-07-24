#ifndef MEMORYLIST_H
#define MEMORYLIST_H
#include "memory.h"
#include <QObject>
#include <QList>

//its Subclass of Memory, cause we need the title properties. We set them with our Data from XML. you can see in "setMemoryByArt"
// but we dont need to Read the whole Load. We need a function to activate the load. So Property WRITE. setLoad acitvate the Data load in our QList<Memory>
// also we dont need to write the length, we just need it in for loops in QML. So we just need the READ property. "obviously" ;)
// we cant get/set QLists by Propertys
// you have to load the Memory List with "setLoad",  Memory by Art to. It loads a Memory by Art Input.
//EXAMPLE: title:"playing game with friends", so is art:"friends" -> ask in QML for loadMemoryByArt loads an memory from art = "friends" -> gives the title

class MemoryList : public  Memory
{
    Q_OBJECT
    Q_PROPERTY(QString load WRITE setLoad NOTIFY loadChanged)
    Q_PROPERTY(int length READ getLength NOTIFY lengthChanged)
    Q_PROPERTY(QString loadMemoryByArt READ getMemoryByArt WRITE setMemoryByArt NOTIFY loadMemoryByArtChanged)
    Q_PROPERTY(QString loadMemoryByIndex READ getMemoryByIndex  WRITE setMemoryByIndex )
    Q_PROPERTY(QString loadRandom READ getLoadRandom  WRITE setLoadRandom )


public:
    MemoryList();
    //getter/setter some are connected to QML
    void setMemoryByIndex(QString i);
    void setListOfAllMemorys();
    void setLoad(QString str);
    void setMemoryByArt(QString value);
    void setLoadRandom(const QString &value);








    QString getMemoryByArt() const;
    QString getMemoryByIndex();
    int getLength();
    QList<Memory*> getListofAllMemorys();
    QString getLoadRandom() const;





    //intern Methods
    void setCurrentMemoryFromListAt(QList<Memory*> list, int i);







signals:


    void loadChanged();
    void lengthChanged();
    void loadMemoryByArtChanged();


private:

    int length;
    QString load;
    QString loadMemoryByArt;
    QList<Memory*> listofAllMemorys;
    QString loadMemoryByIndex;
    QString loadRandom;

};



#endif // memorylist_h
