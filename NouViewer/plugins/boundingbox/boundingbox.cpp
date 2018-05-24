#include "boundingbox.h"
#include "glwidget.h"
#include <QPainter>

void Boundingbox::createbuffers(GLWidget &g){
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


void Boundingbox::generate_vbo(GLuint &vbo_id, GLsizeiptr size, const GLfloat *data, GLuint attribute_id, GLint attribute_size, GLWidget &g) {
  	g.glGenBuffers(1, &vbo_id);
  	g.glBindBuffer(GL_ARRAY_BUFFER, vbo_id);
  	g.glBufferData(GL_ARRAY_BUFFER, sizeof(GLfloat)*size, data, GL_STATIC_DRAW);
  	g.glVertexAttribPointer(attribute_id, attribute_size, GL_FLOAT, GL_FALSE, 0, 0);
  	g.glEnableVertexAttribArray(attribute_id);
}

void Boundingbox::onPluginLoad()
{
	glwidget()->makeCurrent();	
	vs=new QOpenGLShader(QOpenGLShader::Vertex, this);
  	vs->compileSourceFile("/home/thor/Grafics-FIB/NouViewer/plugins/boundingbox/vertex.vert");
  	fs=new QOpenGLShader(QOpenGLShader::Fragment, this);
  	fs->compileSourceFile("/home/thor/Grafics-FIB/NouViewer/plugins/boundingbox/fragment.frag");
  	program = new QOpenGLShaderProgram(this);
  	program->addShader(vs);
  	program->addShader(fs);
  	program->link();
	created = false;
}

void Boundingbox::preFrame()
{

	
}

void Boundingbox::drawCapsa(GLWidget &g)
{

	QMatrix4x4 MVP=camera()->projectionMatrix()*camera()->viewMatrix();
	program->setUniformValue("modelViewProjectionMatrix", MVP);

	Scene* sc = scene();
	const vector<Object> &obj = sc->objects();
	for(int i=0; i<(int)obj.size(); i++){
		program->setUniformValue("boundingBoxMin",obj[i].boundingBox().min());
		program->setUniformValue("boundingBoxMax", obj[i].boundingBox().max());
		g.glBindVertexArray(cubeVAO);
		g.glDrawArrays(GL_TRIANGLE_STRIP, 0, 18);
		g.glBindVertexArray(0);
	}	

	
}

void Boundingbox::postFrame() { 
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


void Boundingbox::onObjectAdd()
{
	
}

bool Boundingbox::drawScene()
{
	return false; // return true only if implemented
}

bool Boundingbox::drawObject(int)
{
	return false; // return true only if implemented
}

bool Boundingbox::paintGL()
{
	return false; // return true only if implemented
}

void Boundingbox::keyPressEvent(QKeyEvent *)
{
	
}

void Boundingbox::mouseMoveEvent(QMouseEvent *)
{
	
}

