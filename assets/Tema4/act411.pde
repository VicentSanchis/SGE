/**
* Activitat 410. Paràmetres coordenades
* ---------------------------------------------------------------------------
* Modifica el codi anterior per tal que tant el codi que dibuixa els ulls 
* com el codi que dibuixa la boca, estiguen en dues funcions: dibuixaUlls i dibuixaBoca. 
* A aquestes funcions se'ls passarà com a paràmetres les coordenades x i y 
* i a partir d'aquestes ha de dibuixar els ulls i la boca on corresponga.
* @author Vicent Sanchis
* @since 26 de novembre del 2023
* @version 1.0
*/
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size(320,240);
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
  background(255);
  stroke(0);
  dibuixaSmiley (150, 120);
  
}
/**
* dibuixaSmiley és el mètode que dibuixa la careta sencera a partir de les coordenades que es passen
* per paràmetre com a punt de referència. Bàsicament el que fa és cridar a les funcions de l'activitat
* anterior però parametritzades amb x i y com ens demana l'activitat.
* @param x coordenada x de referència on es dibuixarà la cara
* @param y coordenada y de referència on es dibuixarà la cara.
* @return void
*/
void dibuixaSmiley (int x, int y) {
  dibuixaCara (x, y);
  dibuixaUlls (x, y);
  dibuixaBoca (x, y);
}
/**
* Mètode dibuixaCara dibuixa la cara en forma de cercle groc de l'smiley
* @param x coordenada x de referència on es dibuixarà la cara
* @param y coordenada y de referència on es dibuixarà la cara. 
* @return void
*/
void dibuixaCara (int x, int y) {
  strokeWeight (2);
  fill (255, 255, 0);
  circle (x, y, 100);
}
/**
* Mètode dibuixaUlls, dibuixa els ulls de l'smile com a cercles blancs
* amb un punt negre enmig.
* @param x coordenada x de referència on es dibuixarà la cara
* @param y coordenada y de referència on es dibuixarà la cara.
* @return void
*/
void dibuixaUlls (int x, int y) {
  strokeWeight (2);
  fill (255);
  circle (x-20,y-10,20);
  circle(x+15,y-10,20);
  strokeWeight(5);
  point(x-17,y-10);
  point(x+18,y-10);
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
