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

const float PI = cos(-1);

void main()
{
    float wy = 0.4 * vertex.y * sin(2*PI*time);
    mat3 T = mat3(vec3(-cos(wy),0, sin(wy)), vec3(0,-1,0), vec3(-sin(wy), 0, -cos(wy)) );
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(T*vertex, 1.0);
}
