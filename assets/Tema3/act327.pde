/**
* Activitat 327. comparador de tres números
* -----------------------------------------------------------
* Aquesta aplicació genera aleatòriament tres nombres entre el 0 i el 100
* Després comprova tots els possibles escenaris, els tres śon iguals, només dos són iguals o cap és igual
* i mostra la informació per pantalla
* @author Vicent Sanchis
* @since  28 octubre 2023
* @version 1.0
*/
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (320, 320);
  fill (0);
  textAlign(CENTER);
  textSize(18);
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
  clear();
  background (255);
  
  // Generem els nombre aleatoris
  int num1 = (int) random (0, 100);
  int num2 = (int) random (0, 100);
  int num3 = (int) random (0, 100);
  
  // Comprovem tots els escenaris possibles
  // Primer escenari: els tres números són iguals
  if (num1 == num2 && num2 == num3) {
    text ("Els tres números són iguals", 160, 160);
    text ("Num1 (" + num1 + ") == Num2 (" + num2 + ") == Num3 (" + num3 + ")", 160, 190);
  }  
  // Segon esecenari: num1 és igual a num2
  else if (num1 == num2) { 
    text ("Num1 i num2 són iguals", 160, 160);
    text ("Num1 (" + num1 + ") == Num2 (" + num2 + ")", 160, 190);
  }  
  // Tercer escenari: num1 és igual a num3
  else if (num1 == num3) {
    text ("Num1 i Num3 són iguals", 160, 160);
    text ("Num1 (" + num1 + ") == Num3 (" + num3 + ")", 160, 190);
  } 
  // Quart escenari: num2 és igual a num3
  else if (num2 == num3) {
    text ("Num2 i num3 són iguals", 160, 160);
    text ("Num2 (" + num2 + ") == Num3 (" + num3 + ")", 160, 190);
  }  
  // Cinqué escenari: cap nombre és igual
  else
    text ("Cap nombre és igual", 160, 160); //<>//
  
   //<>//
  delay (1000);
}
/**
* Esdeveniment mouseClicked: controla les tecles que es premen al teclat.
* @return void
*/
void mouseClicked() {
  println("(" + mouseX + "," + mouseY + ")");
}
