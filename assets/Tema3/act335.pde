/**
* Activitat 335. Dibuixa diagonals
* -----------------------------------------------------------
* A una apliació de 500x500 de dimensions dibuixa les dues diagonals.
* Una representada per quadrats i l'altra amb cercles.
* @author Vicent Sanchis
* @since  7 novembre 2023
* @version 1.0
*/
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (500, 500);
  fill (255);
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
  /* Abans deuriem saber quants cercles i quadrats caben a la diagonal.
     Com que l'ample i l'alt són de 500 pixels, si els elements tenen un ample
     de 20 pixels, 500 entre 20 dona 25. És a dir, podem posar a cada diagonal
     un total de 25 elements */
    
  // Primera diagonal
  for (int i = 0; i < 25; i ++) {
    int pos = i*25 + 25/2;      // Càlcul de la posició a la que dibuixarem element.
    circle(pos, pos, 25);
  }
  
  // Segona diagonal
  for (int j = 0; j < 25; j ++) {
    int posX = 500 - 25 - j*25 + 25/2; 
    int posY = j*25;
    rect (posX, posY, 25, 25);
  }
} //<>//
/**
* Esdeveniment mouseClicked: controla les tecles que es premen al teclat.
* @return void
*/
void mouseClicked() {
  println("(" + mouseX + "," + mouseY + ")");
}
