/**
 * Activitat 601. Volcano - Programació Estructurada
 * ------------------------------------------------------------------------------------------------------------------
 * Simulació d'un volcà en erupció. Bàsicament es tracta de simular un sistema de particules eixint d'un triangle
 * que faria de con del volcà, com si fos una erupció d'un volcà
 * @author  Vicent Sanchis
 * @since   29/01/24
 * @version 1.0
 */
// ---------------------------------------------------------------------------------------------------------------
// Llibreries, imports, packages ..
// ---------------------------------------------------------------------------------------------------------------

// ---------------------------------------------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------------------------------------------
final static int TAM = 10;                          // Grandaria de les boletes que expulsa el volcà
final static int ERUPCIO_X = 320, ERUPCIO_Y=150;    // Punt des d'on es produiran les erupcions del volcà
final static PVector GRV = new PVector(0, 0.03);  // Força de la gravetat del nostre sistema de físiques
// ---------------------------------------------------------------------------------------------------------------
// Variables globals
// ---------------------------------------------------------------------------------------------------------------
int currentInterval;
ArrayList <PVector> alPosicions;                   // ArrayList al que guardem les posicions de les boletes 
ArrayList <PVector> alDireccions;                  // ArrayList que contindrà les direccions de les boletes
ArrayList           alVelocitats;                  // ArrayList on s'emmagatzemen les velocitats de les boletes
ArrayList           alVides;                       // Arraylist on es controla el temps de vida que queda
// ---------------------------------------------------------------------------------------------------------------
/**
 * Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació.
 * Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
 * @return void
 */
void setup () {
  size (640, 480);
  currentInterval = 0;
  alPosicions     = new ArrayList<PVector>();
  alDireccions    = new ArrayList<PVector>();
  alVelocitats    = new ArrayList();
  alVides         = new ArrayList();
}
/**
 * Metode draw: aquest mètode funciona com una espècies de bucle del joc.
 * S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
 * És en aquest mètode on s'aprofita per fer animacions
 */
void draw() {
  clear      ();
  background (255);
  creaBoleta        ();
  actualitzaBoletes ();
  dibuixaBoletes    ();
  dibuixaVolca      ();
}
/**
* Crea una boleta nova afegint una nova posició (PVector) a l'array de boletes global
* per tal que puga ser expulsada del volcà. Cada boleta tindrà una direcció (alDireccions) i una velocitat (aVelocitats)
*/
void creaBoleta () {
   if (frameCount - currentInterval > 20) {
     alPosicions.add  (new PVector (ERUPCIO_X, ERUPCIO_Y)); //<>//
     alDireccions.add (new PVector (random(-0.7,0.7),random(-2,-0.4)));
     alVelocitats.add (random(5,10));
     alVides.add (255);
     currentInterval = frameCount;
     
   }
}
/**
* Actualitza a cada frame la posició, velocitat i direcció de la boleta aplicant les lleis de la gravetat i una xicoteta
* fricció de l'aire. A cada frame anirà també apagant les boletes decrementant el lifeSpan que es troba en un array global
*/
void actualitzaBoletes () {
  for (int i=0; i < alPosicions.size(); i ++) {
    PVector pos = alPosicions.get(i);
    PVector dir = alDireccions.get(i);
    PVector fri = dir.copy().mult(-0.001);
    dir.add (fri);
    dir.add (GRV);
    pos.add (dir);
    
    // Actualitzem la vida de les boletes
    int vida = (int)alVides.get(i);
    vida --;
    alVides.set(i,vida);
  }
}
/**
* Recorre els arrays de les boletes i les dibuixa al la posició que els pertoque amb la quantitat de vida que els queda (transparència)
* Per no complicar més el programa, totes les boletes tindran una grandària de 20 píxels i seran de color roig
*/  
void dibuixaBoletes () {
  for (int i=0; i < alPosicions.size(); i++) {
    fill(255,0,0, (int)alVides.get(i));
    noStroke();
    circle (alPosicions.get(i).x, alPosicions.get(i).y, TAM);
  }
}
/**
* Dibuixa un triangle de color negre de tal forma que coincideixca la punta de dalt amb les coordenades d'expulsió de les boletes.
*/
void dibuixaVolca () {
  fill(0);
  triangle (ERUPCIO_X, ERUPCIO_Y-10, ERUPCIO_X+70, ERUPCIO_Y+110, ERUPCIO_X-70, ERUPCIO_Y+110);
}
