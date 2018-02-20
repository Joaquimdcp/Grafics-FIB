#version 330 core

in  vec4 frontColor;
out vec4 fragColor;

in vec3 normalCoord;



void main()
{
    fragColor   = frontColor * normalCoord.z;
}
