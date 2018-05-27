#version 330 core

layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 projectionMatrix;
out vec2 textCoord;

uniform float side=0.1;
void main( void )
{
	vec3 C = gl_in[0].gl_Position.xyz;
	float costat = side/2.0;

	vec3 F1 = C + vec3(-costat, costat,  costat);
	vec3 F2 = C + vec3(costat, costat,  costat);
	vec3 F3 = C + vec3(-costat, -costat, costat);
	vec3 F4 = C + vec3(costat, -costat, costat);



	// FRONT
	textCoord = vec2(0.0,1);
	gl_Position = projectionMatrix*vec4(F1,1);
	EmitVertex();
	textCoord = vec2(1,1);
	gl_Position = projectionMatrix*vec4(F2,1);
	EmitVertex();
	textCoord = vec2(0.0,0.0);
	gl_Position = projectionMatrix*vec4(F3,1);
	EmitVertex();
	textCoord = vec2(1,0);
	gl_Position = projectionMatrix*vec4(F4,1);
	EmitVertex();

	EndPrimitive();




}
