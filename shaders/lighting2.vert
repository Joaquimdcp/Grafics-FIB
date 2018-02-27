#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

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


vec4 light( vec3 N, vec3 L, vec3 V){
	// ATENCIO NORMALITZAR TOT, SINO NO FUNCIONA
	L = normalize(L);
	vec3 R = -reflect(L,N); // IMPORTANT HA DE SER NEGATIU
	float NL =  max(0, dot(N, L) );
	float RV =  max(0, dot(normalize(R), normalize(V)));
	return (matAmbient*lightAmbient) + (matDiffuse*lightDiffuse)*(NL) + (matSpecular*lightSpecular)*pow(RV,matShininess);
}


// WORLD SPACE 
// VERTEX      -> ES EL VERTEX QUE ENS PASSEN
// LIGHT       -> ENS LA DONEN PER EYE SPACE PER TANT inv(modelViewMat) * lightPosition
// OBSERVADOR  -> LA TERCERA COLUMNA DE LA INVERSA DE LA inv(MODEL VIEW MATRIX)[2]
void main()
{

    vec3 N   = normalize(normalMatrix * normal);
    vec3 pos = (modelViewMatrix * vec4(vertex,1.0)).xyz;  // EN AQUEST MOMENT ESTEM A EYE SPACE
    vec3 V = normalize( vec3(0,0,0) - pos); // FEM UNA RESTA CONSIDEREM QUE EL OBSERVADOR ESTA A L'ORIGEN
    vec3 L = ( lightPosition.xyz - pos );
    frontColor = light(N, L, V);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
