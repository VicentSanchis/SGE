/** 
* Activitat 412
* ----------------------------------------------------------------------------
* Ampiem l'activitat 410 per tal que dibuixe tres smileys: un cercle groc, 
* un quadrat blau i un triangle púrpura. S'ha de tenir en compte que un dels
* forts de la modularització és la reutilització del codi. Els ulls i boca
* sòn iguals per a tots però canviant de posició, d'ahí la parametrització
* dels mètodes.
* @author Vicent Sanchis
* @since 29 de novembre del 2023
* @version 1.0
*/
// Variables Globals
int cercleX, cercleY, triangleX, triangleY, quadratX, quadratY;
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
    size (640, 300);
    // Coordenades del cercle
    cercleX = 150;
    cercleY = 150;

    // Coordenades del primer punt del triangle
    triangleX = 320;
    triangleY = 150;

    // Coordenades del quadrat
    quadratX = 470;
    quadratY = 150;
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
    background(255);

    // Codi per dibuixar el cercle
    dibuixaCercle (cercleX, cercleY);
    dibuixaUlls   (cercleX, cercleY);
    dibuixaBoca   (cercleX, cercleY);

    // Codi per dibuixar el triangle
    dibuixaTriangle (triangleX, triangleY);
    dibuixaUlls     (triangleX, triangleY);
    dibuixaBoca     (triangleX, triangleY);

    // Codi per dibuixar el quadrat
    dibuixaQuadrat (quadratX, quadratY);
    dibuixaUlls    (quadratX, quadratY);
    dibuixaBoca    (quadratX, quadratY);
}
/**
* Mètode dibuixaCercle dibuixa la cara en forma de cercle groc de l'smiley
* @param x coordenada x de referència on es dibuixarà la cara
* @param y coordenada y de referència on es dibuixarà la cara. 
* @return void
*/
void dibuixaCercle (int x, int y) {
  strokeWeight (2);
  fill (255, 255, 0);
  circle (x, y, 100);
}
/**
* Mètode dibuixaTriangle dibuixa la cara en forma de triangle púrpura de l'smiley
* @param x coordenada x de referència on es dibuixarà la cara
* @param y coordenada y de referència on es dibuixarà la cara. 
* @return void
*/
void dibuixaTriangle (int x, int y) {
  strokeWeight (3);
  fill (255, 0, 255);
  //triangle (250,200,320,100,390,200);
  triangle (x-70, y+50, x, y-50, x+70, y+50);
}
/**
* Mètode dibuixaQuadrat dibuixa la cara en forma de quadrat blau de l'smiley
* @param x coordenada x de referència on es dibuixarà la cara
* @param y coordenada y de referència on es dibuixarà la cara. 
* @return void
*/
void dibuixaQuadrat (int x, int y) {
  rectMode(CENTER);  // Necessari per tal que el punt de referència de dibuix del quadrat siga el centre
  strokeWeight(3);
  fill(0,255,255);
  rect(quadratX, quadratY, 100, 100);
}
/**
* Mètode dibuixaUlls, dibuixa els ulls de l'smile com a cercles blancs
* amb un punt negre enmig.
* @param x coordenada x de referència on es dibuixarà la cara
* @param y coordenada y de referència on es dibuixarà la cara.
* @return void
*/
void dibuixaUlls (int x, int y) {
  // Dibuixem ulls
  strokeWeight (2);
  fill (255);
  circle (x-20, y-10, 20);
  circle (x+15, y-10, 20);
 
  // Dibuixem pupil·les
  strokeWeight(5);
  point (x-17, y-10);
  point (x+18, y-10);
}
/**
* Mètode dibuixaBoca dibuixa la boca a l'smiley com un arc negre.
* @param x coordenada x de referència on es dibuixarà la cara
* @param y coordenada y de referència on es dibuixarà la cara.
* @return void
*/
void dibuixaBoca (int x, int y) {
  noFill();
  strokeWeight(2);
  arc(x, y+15, 40, 30, 0, PI);
}
// Mètode auxiliar
void mouseClicked() {
  System.out.println("X: " + mouseX);
  System.out.println("Y: " + mouseY);
}
