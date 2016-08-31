

PImage imagen;

// Mostrar info arriba
boolean info = true;

modoMezcla mezclador;
int numModo = 0; // numero de mezcla incial (max 23)

void setup() {
  size( 787, 559, P2D );
  imagen = loadImage( "IMG_1405-18.jpg" );
  mezclador = new modoMezcla();
}


void draw() {

  // Se va a mezclar la imagen consigo misma pero desfasada
  int desfase = (int)(sin(millis()/1800.0) * 30);
  image(imagen, desfase, desfase);
  filter(INVERT);
  // se pueden usar THRESHOLD, GRAY, OPAQUE, INVERT, POSTERIZE, BLUR, ERODE, or DILATE
  PImage c = get(0, 0, width, height);


  // la mezcla
  mezclador.setup(float(width), float(height), c, imagen);
  float opacidad = float( mouseX ) / float( width );
  mezclador.draw(numModo, opacidad);


  // Muestra informacion en una barra arriba
  if (info) {
    fill(255, 255, 255, 200);
    noStroke();
    rect(0, 0, width, 50);

    pushStyle();
    textAlign(LEFT);
    textSize(20);
    fill(60);
    text( "Modo " + numModo + ") " + mezclador.blendNames[ numModo ] + " - Oprime teclas UP, DOWN", 10, 30 );
    popStyle();

    pushStyle();
    textAlign(RIGHT);
    fill(60);
    textSize(20);
    text(" Opacidad: "+ floor(opacidad * 100) + "% (mouse)", width - 10, 30);
    popStyle();
  }
}

void keyPressed() {
  if (keyCode == UP) {
    numModo--;
  } else if (keyCode == DOWN) {
    numModo++;
  } 
  
  if ( numModo > mezclador.totalModos ) numModo =  0;
  else if ( numModo <  0 ) numModo = mezclador.totalModos;
}