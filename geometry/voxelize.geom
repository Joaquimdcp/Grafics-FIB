#version 330 core

layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform float step=0.2;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;


const vec4 GREY=vec4(vec3(0.8), 1);

void main( void )
{
	vec3 centre = (gl_in[0].gl_Position.xyz + gl_in[2].gl_Position.xyz + gl_in[2].gl_Position.xyz)/3;
	vec3 aux;

	// CARA FRONTAL
	vec3 N=normalMatrix*vec3(0, 0, 1);
	aux.x = centre.x - step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x - step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1);
	EmitVertex();

	aux.x = centre.x + step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x + step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	EndPrimitive();


	// CARA SUPERIOR
	 N=normalMatrix*vec3(0, 1, 0);
	aux.x = centre.x - step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x + step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1);
	EmitVertex();

	aux.x = centre.x + step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z - step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x - step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z - step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	EndPrimitive();



	// LEFT
	N=normalMatrix*vec3(-1, 0, 0);
	aux.x = centre.x - step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z - step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x - step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z - step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1);
	EmitVertex();

	aux.x = centre.x - step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x - step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	EndPrimitive();

	// BOTTOM
	N=normalMatrix*vec3(0, -1, 0);
	aux.x = centre.x - step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z - step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x - step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1);
	EmitVertex();

	aux.x = centre.x + step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z - step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x + step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	EndPrimitive();


	// BACKGROUND
	N=normalMatrix*vec3(0, 0, -1);
	aux.x = centre.x + step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x - step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z - step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1);
	EmitVertex();

	aux.x = centre.x + step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z - step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x - step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z - step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	EndPrimitive();


	// RIGHT
	N=normalMatrix*vec3(1, 0, 0);
	aux.x = centre.x + step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z - step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x + step/2;
	aux.y = centre.y + step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1);
	EmitVertex();

	aux.x = centre.x + step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z - step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	aux.x = centre.x + step/2;
	aux.y = centre.y - step/2;
	aux.z = centre.z + step/2;
	gfrontColor=GREY*N.z;
	gl_Position = modelViewProjectionMatrix*vec4(aux,1 );
	EmitVertex();

	EndPrimitive();









}
