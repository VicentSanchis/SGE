/**
* Activitat 307. Dibuixa amb Processing IDE
* -----------------------------------------------------------
* Utilitzant les primitives de dibuix que ens ofereix l'API de Processing IDE i l'estructura seqüencial que hem vist, 
* s'ha de fer un dibuix simple lliure. Has d'investigar les funcions de dibuix de Processing IDE
* @author Vicent Sanchis
* @since  10 octubres 2023
* @version 1.0
*/
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (320, 320);
  background (50, 255, 255);
  fill (0);
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
  
  // Dibuixem les muntanyes
  fill   (0, 255, 0);
  stroke (0, 255, 0);
  rect   (  0, 240, 250,  80);
  rect   (240, 265, 100, 100);
  stroke (0);
  arc    (200, 300, 300, 140, PI+PI/3, TWO_PI-0.3);
  arc    (  0, 270, 250, 240, PI,      TWO_PI    );
  
  // Dibuixem la casa
  fill(240);
  rect(200, 170, 80, 80);
  
  // Dibuixem la teulada
  fill (255, 0, 0);
  triangle (170, 170, 310, 170, 240, 120);
  fill (130, 40, 60);
  rect (230, 210, 20, 40);
  
  // Dibuixem el sol
  fill (0, 0, 230);
  circle (240, 185, 20);
  fill (255, 225, 0) ;
  circle (50, 50, 50);
  line (50, 22,  50,   5);
  line (70, 30,  90,  15);
  line (75, 50, 100,  50);
  line (70, 70,  85,  85);
  line (50, 75,  50, 100);
  line (25, 65,  10,  75);
  line (20, 50,   5,  50);
  line (30, 30,  15,  15);
  
  // Dibuixem l'arbre
  fill (100, 80, 35);
  rect (130, 190, 10, 50);
  fill (65, 125, 0);
  circle (120, 185, 30);
  circle (150, 185, 33);
  circle (160, 160, 30);
  circle (130, 140, 45);
  circle (132, 160, 40);
  circle (105, 160, 35);
}
/**
* Esdeveniment mouseClicked: controla les tecles que es premen al teclat.
* @return void
*/
void mouseClicked() {
  println("(" + mouseX + "," + mouseY + ")");
}
