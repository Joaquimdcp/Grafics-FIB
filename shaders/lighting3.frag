#version 330 core

out vec4 fragColor;

in vec3 position;
in vec3 normal_frag;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;

uniform vec4 lightAmbient;   // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse;   // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular;  // similar a gl_LightSource[0].specular
uniform vec4 lightPosition;  // similar a gl_LightSource[0].position (sempre estarà en eye space)

uniform vec4 matAmbient;     // similar a gl_FrontMaterial.ambient
uniform vec4 matDiffuse;     // similar a gl_FrontMaterial.diffuse
uniform vec4 matSpecular;    // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess



vec4 light( vec3 N, vec3 L){
	// ATENCIO NORMALITZAR TOT, SINO NO FUNCIONA
	L = normalize(L);
	vec3 H = normalize(normalize(vec3(0,0,1)) + L);
	float NL =  max(0, dot(N, L) );
	float NH =  max(0, dot(N, H) );
	return (matAmbient*lightAmbient) + (matDiffuse*lightDiffuse)*(NL) + (matSpecular*lightSpecular)*pow(NH,matShininess);
}

void main()
{   
    vec3 L = ( lightPosition.xyz - position );
    fragColor = light(normalize(normal_frag), L);
}
