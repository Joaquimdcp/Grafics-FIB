#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform int nstripes = 16;
uniform vec2 origin=vec2(0,0);

const vec4 YELLOW = vec4(255,255, 0, 1);
const vec4 RED = vec4(255,0, 0, 1);


void main()
{
    // EL LENGTH SERVEIX PER CALCULAR LA DISTANCIA ENTRE DOS VECTORS
    int dist = int(length(vtexCoord - origin) * nstripes);
    if( mod(dist,2) == 1)  fragColor = YELLOW;
    else fragColor = RED;

}
