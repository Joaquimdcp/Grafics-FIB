-------------------------------FUNCIONS---------------------------------

normalize(vec)                      //vector normalitzat

texture(sampler2D, vec2 vtexCoord); //color del fragment a la textura

mod(float, int);                    //modul

clamp(x, minVal, maxVal);           //limita el valor de x

pow(n, m);                          //potencia

distance(vec a, vec b)              //distancia entre dos punts a i b(vec)

lenght(vec a)                       //largaria o modul del vector a

fract(float)                        //retorna la part fraccionara del float

mix(vec start, vec end, a)          //a = [0 .. 1], retorna interpolacio

dFdx(vec) dFdy(vec)                 //retorna derivada parcial respecte x o y

cross(vec a, vec b)                 //cross product:
                                    /// vec3(a[1]*b[2]−b[1]*a[2],
                                    ///      a[2]*b[0]-b[2]*a[0],
                                    ///      a[0]*b[1]−b[0]*a[1])
----------------------------UTILS & CONST-------------------------------

//matriu rotar a radinats:
mat3 R=mat3(vec3(cos(a),    0,      -sin(a)),
            vec3(0,         1,      0),
            vec3(sin(a),    0,      cos(a)));
                
const float PI = atan(-1);

const vec4 RED=vec4(1,0,0,1);
const vec4 YELLOW=vec4(1,1,0,1);
const vec4 GREEN=vec4(0,1,0,1); 
const vec4 CYAN=vec4(0,1,1,1);
const vec4 BLUE=vec4(0,0,1,1);

-------------------------------UNIFORMS---------------------------------
uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;

//inverse:
uniform mat4 modelMatrixInverse;
uniform mat4 viewMatrixInverse;
uniform mat4 projectionMatrixInverse;
uniform mat4 modelViewMatrixInverse;
uniform mat4 modelViewProjectionMatrixInverse;


uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

//llum:
uniform vec4 lightAmbient;
uniform vec4 lightDiffuse;
uniform vec4 lightSpecular;
uniform vec4 lightPosition; //esta sempre en eyeSpace

//material:
uniform vec4 matAmbient;
uniform vec4 matDiffuse;
uniform vec4 matSpecular;
uniform float matShininess;

-----------------------------VERTEX SHADER------------------------------

vec4 gl_Position; //posicio del vertex a cliping


----------------------------FRAGMENT SHADER-----------------------------

vec4 fragColor; //color de sortida del fragment
