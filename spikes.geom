#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

in vec3 N[];

uniform mat4 projectionMatrix;
uniform float disp=0.05;

void main( void )
{
	vec3 centre = (gl_in[0].gl_Position.xyz + gl_in[1].gl_Position.xyz + gl_in[2].gl_Position.xyz)/3;
	vec3 normal = (N[0]+N[1]+N[2])/3;
	vec3 aux = centre+normal*disp;
	for( int i = 1 ; i < 3 ; i++ )
	{
		
		gfrontColor = vfrontColor[i-1]*N[i-1].z;
		gl_Position = projectionMatrix*gl_in[i-1].gl_Position;
		EmitVertex();
		
		gfrontColor = vfrontColor[i]*N[i].z;
		gl_Position = projectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	
		gfrontColor = vec4(1);
		
		gl_Position = projectionMatrix*vec4(aux,1);
		EmitVertex();

		EndPrimitive();
	}
	
	gfrontColor = vfrontColor[2]*N[2].z;
		gl_Position = projectionMatrix*gl_in[2].gl_Position;
		EmitVertex();
		
		gfrontColor = vfrontColor[0]*N[0].z;
		gl_Position = projectionMatrix*gl_in[0].gl_Position;
		EmitVertex();
	
		gfrontColor = vec4(1);
		gl_Position = projectionMatrix*vec4(aux,1);
		EmitVertex();

		EndPrimitive();
	
   
	
}
