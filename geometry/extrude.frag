#version 330 core

in vec4 gfrontColor;
out vec4 fragColor;
in vec3 gNorm;

const vec4 GREY=vec4(vec3(0.8), 1);

uniform mat3 normalMatrix;

void main()
{
    vec3 N=normalize(normalMatrix*gNorm);
    fragColor=GREY*N.z;
}
