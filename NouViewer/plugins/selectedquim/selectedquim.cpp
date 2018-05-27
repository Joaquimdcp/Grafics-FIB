#include "selectedquim.h"
#include "glwidget.h"
#include <QPainter>

void Selectedquim::createbuffers(GLWidget &g){
	GLfloat cube_vertices[]={
	    1, 1, 1,
	    0, 1, 1,
	    1, 0, 1,
	    0, 0, 1,
	    1, 0, 0,
	    0, 0, 0,
	    1, 1, 0,
	    0, 1, 0,
	    1, 1, 1,
	    0, 1, 1,
	    0, 1, 1,
	    0, 1, 0,
	    0, 0, 1,
	    0, 0, 0,
	    1, 0, 1,
	    1, 0, 0,
	    1, 1, 1,
	    1, 1, 0
	  };
	  GLfloat cube_colors[]={
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0,
	    1, 0, 0
	  };
	  g.glGenVertexArrays(1, &cubeVAO);
	  g.glBindVertexArray(cubeVAO);
	  // VBOs Capsa
	  generate_vbo(verticesVBO, 18*3, &cube_vertices[0], 0, 3, g);
	  generate_vbo(colorVBO, 18*3, &cube_colors[0], 2, 3, g);
}


void Selectedquim::generate_vbo(GLuint &vbo_id, GLsizeiptr size, const GLfloat *data, GLuint attribute_id, GLint attribute_size, GLWidget &g) {
  	g.glGenBuffers(1, &vbo_id);
  	g.glBindBuffer(GL_ARRAY_BUFFER, vbo_id);
  	g.glBufferData(GL_ARRAY_BUFFER, sizeof(GLfloat)*size, data, GL_STATIC_DRAW);
  	g.glVertexAttribPointer(attribute_id, attribute_size, GL_FLOAT, GL_FALSE, 0, 0);
  	g.glEnableVertexAttribArray(attribute_id);
}

void Selectedquim::onPluginLoad()
{
	glwidget()->makeCurrent();	
	vs=new QOpenGLShader(QOpenGLShader::Vertex, this);
  	vs->compileSourceFile("/home/thor/Grafics-FIB/NouViewer/plugins/selectedquim/vertex.vert");
  	fs=new QOpenGLShader(QOpenGLShader::Fragment, this);
  	fs->compileSourceFile("/home/thor/Grafics-FIB/NouViewer/plugins/selectedquim/fragment.frag");
  	program = new QOpenGLShaderProgram(this);
  	program->addShader(vs);
  	program->addShader(fs);
  	program->link();
	created = false;
}

void Selectedquim::preFrame()
{

	
}

void Selectedquim::drawCapsa(GLWidget &g)
{

	QMatrix4x4 MVP=camera()->projectionMatrix()*camera()->viewMatrix();
	program->setUniformValue("modelViewProjectionMatrix", MVP);

	Scene* sc = scene();
	int seleccionat=scene()->selectedObject();
	const Object &obj = sc->objects()[seleccionat];
	program->setUniformValue("boundingBoxMin",obj.boundingBox().min());
	program->setUniformValue("boundingBoxMax", obj.boundingBox().max());
	g.glBindVertexArray(cubeVAO);
	g.glDrawArrays(GL_TRIANGLE_STRIP, 0, 18);
	g.glBindVertexArray(0);


	
}

void Selectedquim::postFrame() { 
  GLWidget &g=*glwidget();
  g.makeCurrent();
  if( not created){
	createbuffers(g);
	created = true;
  }
  program->bind();      // pinta el wireframe
  drawCapsa(g);                                    // de las cajas contenedoras de todos los objetos de la escena
  program->release();
}


void Selectedquim::onObjectAdd()
{
	
}

bool Selectedquim::drawScene()
{
	return false; // return true only if implemented
}

bool Selectedquim::drawObject(int)
{
	return false; // return true only if implemented
}

bool Selectedquim::paintGL()
{
	return false; // return true only if implemented
}

void Selectedquim::keyPressEvent(QKeyEvent *)
{
	
}

void Selectedquim::mouseMoveEvent(QMouseEvent *)
{
	
}

