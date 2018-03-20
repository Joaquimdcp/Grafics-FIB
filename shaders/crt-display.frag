#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform int n;

void main()
{
    /**
	FragCoord el que ens dona es la posicio relativa de la finestra, per exemple
	la de baix a la cantonada es (0.5, 0.5)
    **/
    if(int(gl_FragCoord.y)%n == 0) fragColor = frontColor;
    else discard;
}
