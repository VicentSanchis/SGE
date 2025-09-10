/**
* Activitat 414: Joc del dominó
* Es tracta d'utilitzar la funció creada a l'activitat anterior (413) per simular el joc del dominó.
* En principi només es simularà el repartiment aleatori de les fitxes.
* S'ha de tenir en compte que el joc del dominó té 28 fitxes diferents, per tant, no es podran repetir.
* @author Vicent Sanchis
* @since 2 de desembre del 2023
* @verion 1.0
*/
// ---------------------------------------------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------------------------------------------
final int BAIX   = 0;                // Referent a la part superior de la fitxa de dominó.
final int DALT   = 1;                // Referent a la part inferior de la fitxa de dominó.
final int AMPLE  = 100;              // Ample de la fitxa de dominó en píxels.
final int ALT    = 180;              // Alçada de la fitxa de dominó en píxels.
final int OFFSET = 90;               // Píxels d'alçada entre el primer punt de la part dalt i el primer de baix.
final int MARGIN = 20;               // Separació entre les fitxes del dominó.
// ---------------------------------------------------------------------------------------------------------------
// Variables globals
// ---------------------------------------------------------------------------------------------------------------
int origenX, origenY;               // Coordenades de l'origen de la fitxa de dominó. Cantó superior esquerre.
int a1x, a1y, a2x, a2y;             // Coordenades dels punts de la part superior del requadre de punts.
int b1x, b1y, b2x, b2y, b3x, b3y;   // Coordenades dels punts de la part d'enmig del requadre de punts.
int c1x, c1y, c2x, c2y;             // Coordenades dels punts de la part inferior del requadre de punts.
boolean [][] repartides;            // Matriu amb la que controlem quines fitxes han eixit i quines no.
// ---------------------------------------------------------------------------------------------------------------
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (1024, 900); 
  origenX    = 50;
  origenY    = 50;
  repartides = new boolean[6][6];
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. 
* S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
* És en aquest mètode on s'aprofita per fer animacions
*/
void draw() {
  clear ();
  background (0, 127, 0);
  // Bucle que controla les files, un total de 4
  for (int i=0; i < 4; i ++) {  //<>//
    origenY = MARGIN + i*(ALT + MARGIN);
    
    // Bucle que controla les columnes, un total de 7
    for (int j=0; j < 7; j++ ) {
      origenX = MARGIN + j*(AMPLE + MARGIN);
      actualitzaCoordenades ();
      boolean dibuixada = false;
      
      // Amb aquest bucle esperem fins que els punts a i b siguen d'una fitxa que no ha eixit encara
      do {
        int a = (int)random(6);
        int b = (int)random(6);
        
        // Si encara no hem dibuixat eixa fitxa, la dibuixem
        if (repartides[a][b] == false) {
          repartides[a][b] = true;
          dibuixaFitxa (a, b);
          dibuixada = true;
        }
      }
      while (!dibuixada);
    }
  }
  noLoop();  // Només volem que es reparteixquen una vegada
}
/**
* Mètode actualitzaCoordenades
* Cada vegada que diubixem una fitxa hem d'actualitzar les possibles posicions en les
* que es dibuixarien els sis punts de cada requadre ja que la fitxa va canviant de 
* posició conforme anem dibuixant-les.
* @return void
*/
void actualitzaCoordenades () {
  a1x = b1x = c1x = origenX + AMPLE/4;
  a1y = a2y = origenY + ALT/8;
  a2x = c2x = b3x = origenX + 3*AMPLE/4;
  b1y = b2y = b3y = origenY + 2*ALT/8;
  b2x = origenX + AMPLE/2;
  c1y = c2y = origenY + 3*ALT/8;
}
/** 
* Mètode dibuixaFitxa
* Aquest mètode s'encarrega de dibuixar una fitxa de domino amb els punts que es pasen per paràmetre.
* @param a punts del requadre de dalt.
* @param b punts del requadre de baix.
* @return void
*/
void dibuixaFitxa(int a, int b) {
  dibuixaFitxaBuida ();
  dibuixaPunts (a, DALT);  // Les constants DALT i BAIX ens serveixen
  dibuixaPunts (b, BAIX);  // per indicar on volem que es dibuixen els punts.
}
/**
* Mètode dibuixaFitxaBuida dibuixa una fitxa sense cap punt, 
* és a dir, amb la part de dalt i la de baix en blanc.
* @return void
*/
void dibuixaFitxaBuida () {
  // Dibuixem el marc de la peça
  stroke (0);
  strokeWeight (5);
  rect (origenX,origenY,AMPLE,ALT);
  
  // Dibuixem la línia del mig
  strokeWeight (3);
  line (origenX, origenY+ALT/2, origenX+AMPLE, origenY+ALT/2);
  
  // Dibuixem la boleta
  strokeWeight (2);
  fill (255, 204, 0);
  ellipse (origenX+AMPLE/2, origenY+ALT/2, 15, 15);
  fill (255);
}
/**
* Mètode dibuixaPunts dibuixa els punts que s'indique per paràmetre i la posició
* en la que s'han de dibuixar: dalt o baix
* @param punts número entre 0 i 6 que diu els punts que s'han de dibuixar
* @param pos indica la posició on es dibuixaran els punts, dalt o baix. Admet valors: DALT, BAIX
* @return void
*/
void dibuixaPunts (int punts, int pos) { //<>//
  int offsetY = 0;
  
  if (pos != DALT && pos != BAIX) {
    println("Error: posició incorrecta");
    return;
  }
  if (punts > 6) {
    println("Error: les peces tenen un màxim de 6 punts");
    return;
  }
  
  if (pos == BAIX) 
    offsetY = OFFSET;
  
  stroke (0);
  strokeWeight (15);
  
  // Segons el total de punts dibuixarem una cosa o una altra
  switch(punts) {
    case 1:
      point (b2x, b2y+offsetY);
      break;
     
    case 2:
      point (a1x, a1y+offsetY);
      point (c2x, c2y+offsetY);
      break;
      
    case 3:
      point (a1x, a1y+offsetY);
      point (b2x, b2y+offsetY);
      point (c2x, c2y+offsetY);
      break;
      
    case 4:
      point (a1x, a1y+offsetY);
      point (a2x, a2y+offsetY);
      point (c1x, c1y+offsetY);
      point (c2x, c2y+offsetY);
      break;
      
    case 5:
      point (a1x, a1y+offsetY);
      point (a2x, a2y+offsetY);
      point (b2x, b2y+offsetY);
      point (c1x, c1y+offsetY);
      point (c2x, c2y+offsetY);
      break;
      
    case 6:
      point (a1x, a1y+offsetY);
      point (a2x, a2y+offsetY);
      point (b1x, b1y+offsetY);
      point (b3x, b3y+offsetY);
      point (c1x, c1y+offsetY);
      point (c2x, c2y+offsetY);
      break;
  }
}
