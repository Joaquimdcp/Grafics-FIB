#ifndef _BOUNDINGBOX_H
#define _BOUNDINGBOX_H

#include "plugin.h" 

class Selectedquim: public QObject, public Plugin
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
	 void generate_vbo(GLuint &vbo_id, GLsizeiptr size, const GLfloat *data, GLuint attribute_id, GLint attribute_size);
	 void createbuffers();
	 void drawCapsa(GLWidget &g); 

	 GLuint cubeVAO;
  	 GLuint verticesVBO;
  	 GLuint colorVBO;
         GLuint textureID;
  	QOpenGLShaderProgram* program;
    	QOpenGLShader* vs;
    	QOpenGLShader* fs;
	void createbuffers(GLWidget &g);
	void generate_vbo(GLuint &vbo_id, GLsizeiptr size, const GLfloat *data, GLuint attribute_id, GLint attribute_size, GLWidget &g);

  private:
	// add private methods and attributes here
	bool created;
};

#endif
