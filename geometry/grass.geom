#version 330 core

layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 norm[];
out vec4 gfrontColor;
out vec3 gNorm;
out vec3 gPos;

uniform mat3 normalMatrix;
uniform mat4 modelViewProjectionMatrix;


uniform float d=0.1;

vec3 getNormal(vec3 A, vec3 B, vec3 C) {
  vec3 P=B-A;
  vec3 Q=C-A;
  return vec3(P.y*Q.z-P.z*Q.y,P.z*Q.x-P.x*Q.z,P.x*Q.y-P.y*Q.x);
}

void main( void )
{

	vec3 N = (normalize(norm[0]) + normalize(norm[1]) + normalize(norm[2]))/3;

	N = normalize(N);
	//HIGH
	vec3 A1 = gl_in[0].gl_Position.xyz+d*N;
	vec3 A2 = gl_in[1].gl_Position.xyz+d*N;
	vec3 A3 = gl_in[2].gl_Position.xyz+d*N;

	// BELOW
	vec3 V1 = gl_in[0].gl_Position.xyz;
	vec3 V2 = gl_in[1].gl_Position.xyz;
	vec3 V3 = gl_in[2].gl_Position.xyz;

	gNorm = N;
	gPos = A1;
	gl_Position = modelViewProjectionMatrix*vec4(A1,1);
	EmitVertex();

	gNorm = N;
	gPos = A2;
	gl_Position = modelViewProjectionMatrix*vec4(A2,1);
	EmitVertex();

	gNorm = N;
	gPos = A3;
	gl_Position = modelViewProjectionMatrix*vec4(A3,1);
	EmitVertex();

	EndPrimitive();

	N=-N;
	gNorm = N;
	gPos = V1;
	gl_Position = modelViewProjectionMatrix*vec4(V1,1);
	EmitVertex();

	gNorm = N;
	gPos = V3;
	gl_Position = modelViewProjectionMatrix*vec4(V3,1);
	EmitVertex();

	gNorm = N;
	gPos = V2;
	gl_Position = modelViewProjectionMatrix*vec4(V2,1);
	EmitVertex();

	EndPrimitive();

	N=normalize(getNormal(V1, V2, A1));
	// LATERAL
	gNorm = N;
	gPos = V1;
	gl_Position = modelViewProjectionMatrix*vec4(V1,1);
	EmitVertex();

	gNorm = N;
	gPos = V2;
	gl_Position = modelViewProjectionMatrix*vec4(V2,1);
	EmitVertex();

	gNorm = N;
	gPos = A1;
	gl_Position = modelViewProjectionMatrix*vec4(A1,1);
	EmitVertex();

	gNorm = N;
	gPos = A2;
	gl_Position = modelViewProjectionMatrix*vec4(A2,1);
	EmitVertex();

	EndPrimitive();

	N=normalize(getNormal(V3, V1, A3));
	// LATERAL FONS
	gNorm = N;
	gPos = V3;
	gl_Position = modelViewProjectionMatrix*vec4(V3,1);
	EmitVertex();

	gNorm = N;
	gPos = V1;
	gl_Position = modelViewProjectionMatrix*vec4(V1,1);
	EmitVertex();

	gNorm = N;
	gPos = A3;
	gl_Position = modelViewProjectionMatrix*vec4(A3,1);
	EmitVertex();

	gNorm = N;
	gPos = A1;
	gl_Position = modelViewProjectionMatrix*vec4(A1,1);
	EmitVertex();

	EndPrimitive();

	N=normalize(getNormal(V2, V3, A2));
	// FONS DEL TRAINGLE
	gNorm = N;
	gPos = V2;
	gl_Position = modelViewProjectionMatrix*vec4(V2,1);
	EmitVertex();

	gNorm = N;
	gPos = V3;
	gl_Position = modelViewProjectionMatrix*vec4(V3,1);
	EmitVertex();

	gNorm = N;
	gPos = A2;
	gl_Position = modelViewProjectionMatrix*vec4(A2,1);
	EmitVertex();

	gNorm = N;
	gPos = A3;
	gl_Position = modelViewProjectionMatrix*vec4(A3,1);
	EmitVertex();

	EndPrimitive();







}
