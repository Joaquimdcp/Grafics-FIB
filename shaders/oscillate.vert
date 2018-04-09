#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin; // cantonada mínima de la capsa englobant
uniform vec3 boundingBoxMax;

uniform bool eyespace;
uniform float time;

float PI = cos(-1);
void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vec3 V = vertex;
    float r=length(boundingBoxMax-boundingBoxMin)/2;
    float y;
    if(eyespace){
        vec3 text = (modelViewMatrix* vec4(vertex, 1.0)).xyz;
        y = text.y;
    }
    else{
        y = vertex.y;
    }
    V = vertex + normal*((r/10)*y)*sin(time);
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
