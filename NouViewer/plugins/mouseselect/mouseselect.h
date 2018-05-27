#ifndef _MOUSESELECT_H
#define _MOUSESELECT_H

#include "plugin.h" 

class Mouseselect: public QObject, public Plugin
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

	 void keyPressEvent(QKeyEvent *);
	 void mouseMoveEvent(QMouseEvent *);
	 void mouseReleaseEvent(QMouseEvent *);
	 QOpenGLShaderProgram* program;
    	QOpenGLShader* vs;
    	QOpenGLShader* fs;
  private:
	// add private methods and attributes here
};

#endif
