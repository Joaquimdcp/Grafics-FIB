#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

in vec3 unormal[];

const float speed = 1.2;
uniform float time;
uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewProjectionMatrixInverse;

void main( void )
{
	vec3 N=speed*time*(unormal[0]+unormal[1]+unormal[2])/3;
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		// ARA ESTA EN OBJECT SPACE
		vec4 V = modelViewProjectionMatrixInverse*gl_in[i].gl_Position;
		// NOU VERTEX DESPLAÇAT		
		vec3 NV = V.xyz + N;
		gl_Position = modelViewProjectionMatrix*vec4(NV,1);
		EmitVertex();
	}
   	EndPrimitive();
}
