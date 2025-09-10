/**
* Activitat 413. Dibuixa Fitxa
* ----------------------------------------------------------------------------------------------------------------
* Aquesta aplicació dibuixa una fitxa de dominó cridant a una funció
* a la que se li passen dos arguments, el primer indicant el total de 
* punts de la part superior i el segon amb el total de punts de la part
* inferior. Exemple: dibuixaFitxa (5, 4);
* @author Vicent Sanchis
* @since 30 de novembre de 2023
* @version 1.0
*/
// ---------------------------------------------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------------------------------------------
final int BAIX   = 0;                // Referent a la part superior de la fitxa de dominó.
final int DALT   = 1;                // Referent a la part inferior de la fitxa de dominó.
final int AMPLE  = 200;              // Ample de la fitxa de dominó en píxels.
final int ALT    = 360;              // Alçada de la fitxa de dominó en píxels.
final int OFFSET = 180;              // Píxels d'alçada entre el primer punt de la part dalt i el primer de baix.
// ---------------------------------------------------------------------------------------------------------------
// Variables globals
// ---------------------------------------------------------------------------------------------------------------
int origenX, origenY;               // Coordenades de l'origen de la fitxa de dominó. Cantó superior esquerre.
int a1x, a1y, a2x, a2y;             // Coordenades dels punts de la part superior del requadre de punts.
int b1x, b1y, b2x, b2y, b3x, b3y;   // Coordenades dels punts de la part d'enmig del requadre de punts.
int c1x, c1y, c2x, c2y;             // Coordenades dels punts de la part inferior del requadre de punts.
// ---------------------------------------------------------------------------------------------------------------
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size(640,480); 
  
  // Establim les coordenades a partir d'on es dibuixarà la fitxa
  // Punt d'ancoratge: el cantó superior esquerre de la fitxa
  origenX = 50;
  origenY = 50;
  
  // Calculem les posicions relatives del punts de les peces
  // Estes coordenades ens serviran per saber on aniria cada punt
  // en cas de que l'anem a dibuixar.
  a1x = b1x = c1x = origenX + AMPLE/4;
  a1y = a2y = origenY + ALT/8;
  a2x = c2x = b3x = origenX + 3*AMPLE/4;
  b1y = b2y = b3y = origenY + 2*ALT/8;
  b2x = origenX + AMPLE/2;
  c1y = c2y = origenY + 3*ALT/8;
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. 
* S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
* És en aquest mètode on s'aprofita per fer animacions
*/
void draw() {
  dibuixaFitxa (5, 4);
}
/**
* Mètode dibuixaFitxa que s'encarrega de dibuixar la fitxa de dominó
* tenint en compte els paràmetres que indiquen els punts dalt i baix
* @param a total de punts de la part de dalt de la fitxa
* @param b total de punts de la part de baix de la fitxa
* @return void
*/
void dibuixaFitxa(int a, int b) {
  dibuixaFixtaBuida ();
  dibuixaPunts (a, DALT);  // Les constants DALT i BAIX ens serveixen
  dibuixaPunts (b, BAIX);  // per indicar on volem que es dibuixen els punts.
}
/**
* Mètode dibuixaFitxaBuida dibuixa una fitxa sense cap punt, 
* és a dir, amb la part de dalt i la de baix en blanc.
* @return void
*/
void dibuixaFixtaBuida () {
  // Dibuixem el marc de la peça
  stroke (0);
  strokeWeight (5);
  rect (origenX, origenY, AMPLE, ALT);
  
  // Dibuixem la línia del mig
  strokeWeight (3);
  line (origenX, origenY+ALT/2, origenX+AMPLE, origenY+ALT/2);
  
  // Dibuixem la boleta dorada
  strokeWeight (2);
  fill (255, 204, 0);  // Color daurat
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
void dibuixaPunts (int punts, int pos) {
  // Aquesta variable ens servirà per dibuixar correctament els punts dalt o baix
  int offsetY = 0;   
  
  // Comprovació d'errors. Comprovem que els arguments són correctes.
  if (pos != DALT && pos != BAIX) {
    println("Error: posició incorrecta");
    return;
  }
  if (punts > 6 || punts < 0) {
    println("Error: les peces tenen un màxim de 6 punts i un mínim de 0");
    return;
  }
  
  // Si volem dibuixar els punts al quadrant de baix, tenim en compte l'OFFSET
  if (pos == BAIX) 
    offsetY = OFFSET;
  
  stroke(0);
  strokeWeight(25);
  
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
