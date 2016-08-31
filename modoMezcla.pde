// Original shader code by ben
// https://www.shadertoy.com/view/XdS3RW

// Ported to Processing by Raphaël de Courville <Twitter: @sableRaph>

class modoMezcla {

  // The shader that will contain the blending code
  PShader myShader;

  // Let's store the names of the modes too
  String[] blendNames = {
    "Darken", 
    "Multiply", 
    "Color burn", 
    "Linear burn", 
    "Darker color", 
    "Lighten", 
    "Screen", 
    "Color dodge", 
    "Linear dodge", 
    "Lighter color", 
    "Overlay", 
    "Soft light", 
    "Hard light", 
    "Vivid light", 
    "Linear light", 
    "Pin light", 
    "Hard mix", 
    "Difference", 
    "Exclusion", 
    "Substract", 
    "Divide", 
    "Hue", 
    "Color", 
    "Saturation", 
    "Luminosity"
  };

  // Let's give a name to each blend mode
  static final int BL_DARKEN        =  0;
  static final int BL_MULTIPLY      =  1;

  static final int BL_COLORBURN     =  2;
  static final int BL_LINEARBURN    =  3;
  static final int BL_DARKERCOLOR   =  4;

  static final int BL_LIGHTEN       =  5;
  static final int BL_SCREEN        =  6;
  static final int BL_COLORDODGE    =  7;
  static final int BL_LINEARDODGE   =  8;
  static final int BL_LIGHTERCOLOR  =  9;

  static final int BL_OVERLAY       = 10;
  static final int BL_SOFTLIGHT     = 11;
  static final int BL_HARDLIGHT     = 12;
  static final int BL_VIVIDLIGHT    = 13;
  static final int BL_LINEARLIGHT   = 14;
  static final int BL_PINLIGHT      = 15;
  static final int BL_HARDMIX       = 16;

  static final int BL_DIFFERENCE    = 17;
  static final int BL_EXCLUSION     = 18;
  static final int BL_SUBSTRACT     = 19;
  static final int BL_DIVIDE        = 20;

  static final int BL_HUE           = 21;
  static final int BL_COLOR         = 22;
  static final int BL_SATURATION    = 23;
  static final int BL_LUMINOSITY    = 24;

  int totalModos = 24;

  modoMezcla() {
    // Load the shader file from the "data" folder
    myShader = loadShader( "shader.glsl" );
  }

  void setup(float ancho, float alto, PImage fuente, PImage destino) {
    myShader.set( "sketchSize", ancho, alto );
    myShader.set( "topLayer", fuente ); 
    myShader.set( "lowLayer", destino );
    // Resoluciones de las imagenes
    myShader.set( "topLayerResolution", float( fuente.width ), float( fuente.height ) );
    myShader.set( "lowLayerResolution", float( destino.width ), float( destino.height ) );
    // Modo de mezcla ajustado por nombre
    myShader.set( "blendMode", BL_DIFFERENCE );
  }
  void draw(int blendIndex, float blendOpacity) {
    // Que modo de mezcla
    myShader.set( "blendMode", blendIndex );
    // y con que opacidad
    myShader.set( "blendAlpha", blendOpacity );
    // se le aplica a toda geometria desde aqui  
    shader(myShader);
    rect(0, 0, width, height);
    resetShader();
    // hasta aqui
  }
}