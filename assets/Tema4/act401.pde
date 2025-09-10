/**
* Activitat 401. Modularitza el codi
* -----------------------------------------------------------
* El codi de la següent apliacio dibuixa una taula de billar
* amb algunes boles. S'ha de localitzar el codi de cada element
* que dibuixa el nostre programa i modularitzar-lo correctament.
* @author Vicent Sanchis
* @since  21 novembre 2023
* @version 1.0
*/
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size(640, 480);
  background(255);
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
  dibuixarTaula        ();
  dibuixaBolesNegres   ();
  dibuixaBolesBlanques ();
  dibuixaBolesRoges    ();
}
/**
* Mètode dibuixarTaula
* Crida a les primitives de dibuix de Processing IDE necessàries
* per dibuixar la taula de billar. No té paràmetres.
* @return void
*/
void dibuixarTaula() {
  strokeWeight(20);
  stroke(170,120,20);
  fill(0,255,0);
  rect(30,30,500,330);
}
/**
* Mètode dbuixaBolesNegres
* S'encarrega de dibuixar dos boles negres sobre la taula de billar
* @return void
*/
void dibuixaBolesNegres () {
  fill(0);
  strokeWeight(1);
  stroke(200);
  circle(200,200,35);
  circle(400,60,35);
}
/**
* Mètode dbuixaBolesBlanques
* S'encarrega de dibuixar dos boles blanques sobre la taula de billar
* @return void
*/
void dibuixaBolesBlanques () {
  fill(255,255,255);
  circle(300,150,35);
  circle(150,300,35);
}
/**
* Mètode dbuixaBolesRoges
* S'encarrega de dibuixar dos boles roges sobre la taula de billar
* @return void
*/
void dibuixaBolesRoges () {
  stroke(0);
  fill(255,0,0);
  circle(100,100,35);
  circle(350,330,35);
}
