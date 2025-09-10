/**
* Activitat 328. Any Bixest
* -----------------------------------------------------------
* Aquesta aplicació genera aleatòriament un any entre el zero i el 2021
* Després comprova si l'any és bixest o no
* @author Vicent Sanchis
* @since  30 octubre 2023
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
  
  // Generem l'any aleatori
  int anyAleatori = (int) random (0, 2021);   //<>//
  
  if (anyAleatori % 100 != 0) {
    if (anyAleatori % 4 == 0)
      text("L'any " + anyAleatori + " és bixest", 160, 120);
    else
      text("L'any " + anyAleatori + " NO és bixest", 160, 120);
  }
  else {
    if (anyAleatori % 400 == 0)
      text("L'any " + anyAleatori + " és bixest", 160, 120);
    else
      text("L'any " + anyAleatori + " NO és bixest", 160, 120);
  }
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
