#version 330 core

in vec4 gfrontColor;
out vec4 fragColor;

uniform sampler2D colorMap;
in vec2 textCoord;


const vec4 CYAN=vec4(0,1,1,1);

void main()
{
    vec4 TC=texture2D(colorMap, textCoord);
    if(TC.a != 1.0) discard;
    else{
        fragColor = TC;
    }
}
