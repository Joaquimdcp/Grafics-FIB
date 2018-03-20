#version 330 core

in  vec4 frontColor;
out vec4 fragColor;

in vec3 V;

void main()
{

	//CROSS CALCULA EL PRODUCTE ESCALAR
	vec3 dx = dFdx(V);
	vec3 dy = dFdy(V);
	vec3 normal = cross(dx, dy);
    	fragColor = frontColor*(normalize(normal).z);
}
