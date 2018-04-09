#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform bool classic=true;

const float PI=acos(-1);

void main() {
  float d=length(vec2(vtexCoord.x-0.5, vtexCoord.y-0.5));
  float c=step(0.2, d);
  if (classic && c>0.0) {
    float O=atan(u.x, u.y);
    c = step(mod(O/(PI/16)+0.5, 2), 1);
    fragColor=vec4(1, vec2(c), 1);
  } else fragColor=vec4(1, vec2(c), 1);
}