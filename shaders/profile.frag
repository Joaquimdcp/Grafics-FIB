#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec3 V;
in vec3 N;

uniform float epsilon = 0.1 ;
uniform float light = 0.5;

const vec4 GROC = vec4(0.7,0.6,0.0,1);


void main()
{
    vec3 vector = normalize(V);
    vec3 norm   = normalize(N);
    float llindar = abs(dot(V,N));
    if( llindar < epsilon) fragColor = GROC;
    else fragColor = frontColor*light*N.z;
}
