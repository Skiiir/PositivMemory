#include <QDebug>
#include <QScreen>

#include "engine.h"



Engine::Engine(QObject *parent) :  QObject(parent)
{

}

Engine::Engine(const Engine &origin)
{

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
