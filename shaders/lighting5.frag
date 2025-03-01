#version 330 core

out vec4 fragColor;

in vec3 position;
in vec3 normal_frag;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelMatrixInverse;
uniform mat4 viewMatrixInverse;
uniform mat4 modelViewMatrixInverse;

uniform bool world=false;

uniform vec4 lightAmbient;   // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse;   // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular;  // similar a gl_LightSource[0].specular
uniform vec4 lightPosition;  // similar a gl_LightSource[0].position (sempre estarà en eye space)

uniform vec4 matAmbient;     // similar a gl_FrontMaterial.ambient
uniform vec4 matDiffuse;     // similar a gl_FrontMaterial.diffuse
uniform vec4 matSpecular;    // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess



vec4 light(vec3 N, vec3 V, vec3 L)
{
	N=normalize(N); V=normalize(V); L=normalize(L);
	vec3 R = normalize( 2.0*dot(N,L)*N-L );
	float NdotL = max( 0.0, dot( N,L ) );
	float RdotV = max( 0.0, dot( R,V ) );
	float Idiff = NdotL;
	float Ispec = 0;
	if (NdotL>0) Ispec=pow( RdotV, matShininess );
	return matAmbient * lightAmbient  +
	matDiffuse * lightDiffuse * Idiff +
	matSpecular * lightSpecular * Ispec;
}


void main()
{

	vec3 L,V;
	L = lightPosition.xyz - position;
	V = normalize( vec3(0,0,0) - position);
    fragColor = light(normalize(normal_frag), L, V);
}
