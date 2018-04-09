#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;
uniform float amplitude=0.1;

float PI=acos(-1.0);

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(normalize(normalMatrix * normal).z);
    vtexCoord = texCoord;
    vec3 V = vertex + normal*amplitude*sin(2*PI*time+2*PI*texCoord.x);
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
