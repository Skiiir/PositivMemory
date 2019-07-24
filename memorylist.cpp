#include "memorylist.h"
#include <QObject>
#include <QFileInfo>
#include <QDirIterator>
#include <QStandardPaths>
#include <QXmlStreamReader>
#include <QtDebug>
#include <QRandomGenerator>
//Properties and Getter/Setter connected with QML (see Memory)
//




MemoryList::MemoryList ()
{

}
int MemoryList::getLength(){
    //  setListOfAllMemorys();

    int x= listofAllMemorys.length();
    return x;
}

QList<Memory*> MemoryList::getListofAllMemorys() {
    return listofAllMemorys;
}

QString MemoryList::getMemoryByIndex ()  {
    return loadMemoryByIndex;
}


void MemoryList::setLoad(QString str) {
    setListOfAllMemorys();
    load = str;
    emit loadChanged();
}
//Methods to load Memorys by Input
QString MemoryList::getMemoryByArt() const
{
    return loadMemoryByArt;
}

void MemoryList::setMemoryByIndex(QString i) {

    int w = i.toInt();
    // setListOfAllMemorys();
    QList<Memory*> list = listofAllMemorys;
    if (list.length() > w) {
        setCurrentMemoryFromListAt(list, w);


    }
}

void MemoryList::setMemoryByArt(QString value)
{
    //some idea for giving Memory by Art
    // setListOfAllMemorys();
    QList<Memory*> list = listofAllMemorys;
    QList<Memory*> result;
    QList<Memory*>::iterator i;
    for (i = list.begin(); i != list.end(); ++i) {
        if (!(i.operator*()->getArt().compare(value))) {
            Memory* memory;
            memory = i.operator*();
            result.append(memory);
        }
    }

    if(result.length() != 0) {
        int randomNumber = QRandomGenerator::global()->bounded(result.length());
        setCurrentMemoryFromListAt(result, randomNumber);
    } else {
        this->setTitle("");
    }

}
void MemoryList::setCurrentMemoryFromListAt(QList<Memory*> list, int i) {
    if(list.length()>i) {
        //just take one time the list value, then taking it in each Method
        //so create new Memory Item
        Memory *memory = list.value(i);
        this->setTitle(memory->getTitle());
        this->setArt(memory->getArt());
        this->setText(memory->getText());
        this->setOwnPart(memory->getOwnPart());
        this->setIntensity(""+memory->getIntensity());
    } else {
        this->setTitle("");
        this->setArt("");
        this->setText("");
        this->setOwnPart("");
        this->setIntensity("");
    }
}

QString MemoryList::getLoadRandom() const
{
    return loadRandom;
}

void MemoryList::setLoadRandom(const QString &value)
{
    setListOfAllMemorys();

    int randomNumber = QRandomGenerator::global()->bounded(listofAllMemorys.length());
    setCurrentMemoryFromListAt(listofAllMemorys, randomNumber);
    loadRandom = value;
}



void MemoryList::setListOfAllMemorys() {
    QList<Memory*> memoryList;
    listofAllMemorys.clear();

    QFileInfo info = QStandardPaths::writableLocation(QStandardPaths::GenericConfigLocation);

    QString strPath = info.path();
    strPath += "/Memory/";

    //get all files and iterat over them. get the hole data and go append it as a Memory Object in List. Thanks iterator, you are usefull :*

    QDirIterator iterator(strPath, QDirIterator::Subdirectories);
    // iterator.next();
    // iterator.next();
    while (iterator.hasNext()) {
        // iterator.

        QFile file(iterator.next());
        //Reading and Writing cause we set each load a new rating
        if ( file.open(QIODevice::WriteOnly |  QIODevice::ReadOnly) ) {
            //   qDebug() << memory->getText();


            //    if(file.fileName().right(0).compare("l")) {

            Memory *memory = new Memory();
            QXmlStreamReader *xmlReader= new QXmlStreamReader(&file);
            while(!xmlReader->atEnd() && !xmlReader->hasError()) {
                // Read next element
                QXmlStreamReader::TokenType token = xmlReader->readNext();
                //If token is just StartDocument - go to next
                if(token == QXmlStreamReader::StartDocument) {
                    continue;
                }
                if(token == QXmlStreamReader::StartElement) {
                    if(xmlReader->name() == "memory") {
                        continue;
                    }
                    if ( xmlReader->name().toString() == "title") {
                        if(xmlReader)
                            memory->setTitle(xmlReader->readElementText());
                        continue;
                    }
                    if ( xmlReader->name().toString() == "art") {
                        memory->setArt(xmlReader->readElementText());
                        continue;
                    }
                    if ( xmlReader->name().toString() == "text") {
                        memory->setText(xmlReader->readElementText());
                        continue;

                    }
                    if ( xmlReader->name().toString() == "ownPart") {
                        memory->setOwnPart(xmlReader->readElementText());
                        continue;
                    }
                    if ( xmlReader->name().toString() == "intensity") {
                        memory->setIntensity(xmlReader->readElementText());

                    }
                    /*if ( xmlReader->name().toString() == "rating") {
                        int i = xmlReader->readElementText().toInt();
                        memory->setRating((memory->getRating() + i)/2);
                        //  token = xmlReader->readNext();

                    }*/

                }

            }
            memoryList.append(memory);
            if(xmlReader->hasError()) {
                qDebug() << "error";

            }

            //}

        }
    }
    listofAllMemorys =  memoryList;
}




