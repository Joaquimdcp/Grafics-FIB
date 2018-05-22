#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

in vec3 unormal[];

const float speed = 1.2;



const float angSpeed=8.0;

uniform float time;
uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewProjectionMatrixInverse;

void main( void )
{
	vec3 N=speed*time*(unormal[0]+unormal[1]+unormal[2])/3;
	vec3 BT=(gl_in[0].gl_Position.xyz+
          gl_in[1].gl_Position.xyz+
          gl_in[2].gl_Position.xyz)/3;
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		// ARA ESTA EN OBJECT SPACE
		vec3 V=gl_in[i].gl_Position.xyz-BT; 
		// NOU VERTEX DESPLAÇAT		
		float a=time*angSpeed;
  		mat3 Rz=mat3(vec3(cos(a), sin(a), 0),
             		     vec3(-sin(a), cos(a), 0), 
              		    vec3(0, 0, 1));
		vec3 NV = (Rz*V.xyz)+N;
		gl_Position = modelViewProjectionMatrix*vec4(NV,1);
		EmitVertex();
	}
   	EndPrimitive();
}
