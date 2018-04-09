#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform float time;
in vec2 vtexCoord;

uniform sampler2D explosion;
uniform sampler2D frameMap1;

void main()
{
    int frame = int(mod(time/0.1, 48));
    vec2 texCoord=vtexCoord*vec2(1.0/8, 1.0/6);
    texCoord.x+=int(frame%8)/8.0;
    texCoord.y+=int(5-frame/8)/6.0;
    fragColor =texture(explosion, texCoord);
}
