#ifndef _KEYBOARDSELECT_H
#define _KEYBOARDSELECT_H

#include "plugin.h" 

class Keyboardselect: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad();
	 void preFrame();
	 void postFrame();

	 void onObjectAdd();
	 bool drawScene();
	 bool drawObject(int);

	 bool paintGL();

	 void keyPressEvent(QKeyEvent *e);
	 void mouseMoveEvent(QMouseEvent *);
  private:
	// add private methods and attributes here
};

#endif
