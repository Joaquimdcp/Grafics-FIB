#version 330 core

in vec4 gfrontColor;
out vec4 fragColor;
in vec3 gNorm;
in vec3 gPos;
uniform sampler2D grass_top, grass_side;

const vec4 GREY=vec4(vec3(0.8), 1);

uniform mat3 normalMatrix;
uniform float d;
void main()
{
    vec3 N=normalize(normalMatrix*gNorm);
    vec2 grassSideST=vec2(4*(gPos.x-gPos.y), 1.0-gPos.z/d);
    vec4 TGS=texture2D(grass_side, grassSideST);
    vec2 grassTopST=4*gPos.xy;
        vec4 TGT=texture2D(grass_top, grassTopST);
    if(gNorm.z==0){

        if(TGS.a < 0.1) discard;
        else  fragColor = TGS;
    }
    else fragColor=TGT;
}
