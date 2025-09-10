/**
* Activitat 410. Divideix en funcions
* ---------------------------------------------------------------------------
* A partir del codi que ens proporcionen i que dibuixa un smiley, hem de
* dividir el nostre codi en tres funcions (procediments) un que dibuixe els ulls
* un altre que dibuixe la cara i un que dibuixe els ulls.
* Compte amb l'ordre amb que es crida a les funcions perquè pot alterar el resultat.
* @author Vicent Sanchis
* @since 26 de novembre del 2023
* @version 1.0
*/
// Variables globals
int x, y;  // Coordenades de referència on es dibuixara la cara.

/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size(320,240);
  x = 150;
  y = 120;
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
  background(255);
  stroke(0);
  dibuixaCara ();
  dibuixaUlls ();
  dibuixaBoca ();
}
/**
* Mètode dibuixaCara dibuixa la cara en forma de cercle groc de l'smiley
* @return void
*/
void dibuixaCara () {
  strokeWeight(2);
  fill(255,255,0);
  circle(x,y,100);
}
/**
* Mètode dibuixaUlls, dibuixa els ulls de l'smile com a cercles blancs
* amb un punt negre enmig.
* @return void
*/
void dibuixaUlls () {
  strokeWeight(2);
  fill(255);
  circle(130,110,20);
  circle(165,110,20);
  strokeWeight(5);
  point(133,110);
  point(168,110);
}
/**
* Mètode dibuixaBoca dibuixa la boca a l'smiley com un arc negre.
* @return void
*/
void dibuixaBoca () {
  noFill();
  strokeWeight(2);
  arc(150, 135, 40, 30, 0, PI);
}
