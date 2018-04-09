#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

void main()
{
    float a = 1.0/9.0;
    float frame = fract(vtexCoord.x);
    if( (frame>=0 && frame<a) ||
        (frame>=2*a && frame<3*a) ||
        (frame>=4*a && frame<5*a) ||
        (frame>=6*a && frame<7*a) ||
        (frame>=8*a && frame<9*a) ) {
         fragColor = vec4(1.0,1.0,0.0,0.0);
        }
    else fragColor = vec4(1.0,0.0,0.0,0.0);

}
