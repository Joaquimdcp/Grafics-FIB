#include "keyboardselect.h"
#include "glwidget.h"

void Keyboardselect::onPluginLoad()
{
	
}

void Keyboardselect::preFrame()
{
	
}

void Keyboardselect::postFrame()
{
	
}

void Keyboardselect::onObjectAdd()
{
	
}

bool Keyboardselect::drawScene()
{
	return false; // return true only if implemented
}

bool Keyboardselect::drawObject(int)
{
	return false; // return true only if implemented
}

bool Keyboardselect::paintGL()
{
	return false; // return true only if implemented
}


void Keyboardselect::keyPressEvent(QKeyEvent*e) {
  if (e->key()>=Qt::Key_0 && e->key()<=Qt::Key_9) scene()->setSelectedObject(e->key()-Qt::Key_0);
}



void Keyboardselect::mouseMoveEvent(QMouseEvent *)
{
	
}

