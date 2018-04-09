#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

void main()
{
    float d=length(vec2(vtexCoord.x-0.5, vtexCoord.y-0.5));

    /**
    *  genType step(	genType edge, genType x);
    *  For element i of the return value, 0.0 is returned if x[i] < edge[i], and 1.0 is returned otherwise
    **/
    fragColor=vec4(1.0, vec2(step(0.2, d)), 1.0);
}
