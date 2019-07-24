#include <QObject>
#include <QDebug>
#include <QStandardPaths>
#include <QFile>
#include <QFileInfo>
#include <QDir>
#include <QXmlStreamWriter>
#include <QDateTime>
#include <QDir>
#include "memory.h"



Memory::Memory(QObject *parent) :
    QObject(parent)
{
}
//this constuctor is because of the fuckying Qlist, longest MistakeResearch ever.....
Memory::Memory(const Memory& origin)  {

}
//all getter and setter can be used by the qml with reading and writing the object/class.
//thats because of the QPropertys in Header
//the setFile is special
QString Memory::getTitle()
{

    return title;
}
QString Memory::getArt()
{

    return art;
}

QString Memory::getText()

{
        return text;
}
QString Memory::getOwnPart()
{

    return ownPart;
}
QString Memory::getSave() {
    return save;

}

void Memory::setText(QString text)
{
    this->text = text;
    emit textChanged();

}
void Memory::setTitle(QString title) {
    this->title = title;
    emit titleChanged();

}
void Memory::setOwnPart(QString value)
{
    ownPart = value;

}

int Memory::getIntensity()
{
    return intensity;

}

void Memory::setIntensity(QString value)
{
    intensity = value.toInt();

}

int Memory::getRating() const
{
    return rating;
}

void Memory::setRating(int value)
{
    rating = value;
}


void Memory::setArt(QString art) {
    this->art = art;
    emit artChanged();

}
// the input never get save, just the Date of the Memory is the save
// save the file in XML Format.
// StartElement = "memory"
// all attributes have there own Text Element
void Memory::saveFile (QString input) {

    QFileInfo info = QStandardPaths::writableLocation(QStandardPaths::GenericConfigLocation);
    QString folder = info.path();
    QDateTime dt = QDateTime::currentDateTime();

    QDir dir = folder;
    dir.mkdir("Memory");
    folder += "/Memory/";
    save = dt.toString("d MM yy hh mm ss");
    QFile file(folder + dt.toString("d MM yy hh mm ss") + ".xml");
    if (!file.exists()) {
            // create the folder, if necessary
            QDir* dir=new QDir(folder);

            if (!dir->exists()) {
                qWarning("creating new folder");
                dir->mkpath(".");
            }
        }


    file.open(QIODevice::WriteOnly);
    QXmlStreamWriter xmlWriter(&file);
    xmlWriter.setDevice(&file);
    xmlWriter.setAutoFormatting(true);
    xmlWriter.writeStartDocument();
    xmlWriter.writeStartElement("memory");
    xmlWriter.writeTextElement("title", title);
    xmlWriter.writeTextElement("art", art);
    xmlWriter.writeTextElement("text", text);
    xmlWriter.writeTextElement("ownPart", ownPart);
    xmlWriter.writeTextElement("intensity", (QString)intensity);
    //xmlWriter.writeTextElement("rating", (QString)rating);
    xmlWriter.writeEndElement();
    xmlWriter.writeEndDocument();
    qDebug() << file;

    file.close();
}
