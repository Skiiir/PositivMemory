#include <QDebug>
#include <QScreen>
#include <QStandardPaths>
#include <QFile>
#include <QFileInfo>
#include <QDir>

#include "engine.h"



Engine::Engine(QObject *parent) :  QObject(parent)
{

}

Engine::Engine(const Engine &origin)
{

}

QString Engine::getFile()
{
    QFileInfo info = QStandardPaths::writableLocation(QStandardPaths::GenericConfigLocation);

    return info.path();

}


int Engine::getDisplayHeight()
{
    return (displayHeight);
}

void Engine::setDisplayHeight(int value)
{
    displayHeight = getdisplaySize().rheight();

}

int Engine::getDisplayWidth()
{

    return displayWidth;
}

void Engine::setDisplayWidth(int value)
{
    displayWidth = getdisplaySize().rwidth();
}
QSize Engine::getdisplaySize()
{
    return qApp->primaryScreen()->availableSize();

}
