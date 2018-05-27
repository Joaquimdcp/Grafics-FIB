#include "mouseselect.h"
#include "glwidget.h"

void Mouseselect::onPluginLoad()
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
}

void Mouseselect::preFrame()
{
	
}

void Mouseselect::postFrame()
{
	
}

void Mouseselect::onObjectAdd()
{
	
}

bool Mouseselect::drawScene()
{
	return false; // return true only if implemented
}

bool Mouseselect::drawObject(int)
{
	return false; // return true only if implemented
}

bool Mouseselect::paintGL()
{
	return false; // return true only if implemented
}

void Mouseselect::keyPressEvent(QKeyEvent *)
{
	
}

void Mouseselect::mouseMoveEvent(QMouseEvent *)
{
	
}

int decodeID(GLubyte *color) {
  if (color[0]==255) return -1;
  return color[0];
}

void encodeID(int index, GLubyte *color) {
  color[0]=color[1]=color[2]=index;
}

void Mouseselect::mouseReleaseEvent(QMouseEvent *e)
{
    if (!(e->button()&Qt::LeftButton)) return;          // boto esquerre del ratoli
  if (e->modifiers()&(Qt::ShiftModifier)) return;     // res de tenir shift pulsat
  if (!(e->modifiers()&Qt::ControlModifier)) return;  // la tecla control ha d'estar pulsada
    glClearColor(1, 1, 1, 1);                           // esborrar els buffers amb un color de fons únic (blanc)
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
    program->bind();


  // enviar la modelViewProjectionMatrix, i el color identificador dels objectes
	  QMatrix4x4 MVP=camera()->projectionMatrix()*camera()->viewMatrix();
	  program->setUniformValue("modelViewProjectionMatrix", MVP);
	  for (unsigned int i=0; i<scene()->objects().size(); ++i) {
	    GLubyte color[4];
	    encodeID(i, color);
	    program->setUniformValue("color", QVector4D(color[0]/255., color[1]/255., color[2]/255., 1));
	    drawPlugin()->drawObject(i);
	  
	}
	program->release();

	int x=e->x();                                       // llegir el color del buffer de color sota la posició del cursor
  int y=glwidget()->height()-e->y();
  GLubyte read[4];
  glReadPixels(x, y, 1, 1, GL_RGBA, GL_UNSIGNED_BYTE, read);

	int seleccio=decodeID(&read[0]);                    // obtenir l'identificador de l'objecte corresponent i, 
  	scene()->setSelectedObject(seleccio);   
	glwidget()->update();


}

