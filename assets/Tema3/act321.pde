/**
* Activitat 321. Divisió per zero i altres problemes
* -----------------------------------------------------------
* Aquesta aplicació amplia l'activitat 320 i controla un parell d'excepcions.
* La primera que el dividend siga sempre més gran que el divisor.
* La segona que controle que passa quan s'intenta dividir per zero.
* @author Vicent Sanchis
* @since  20 octubre 2023
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
  
  // Generem els dos nombres aleatoris
  int num1 = (int) random (100);
  int num2 = (int) random (100);
  
  // Comprovem quin és el major
  int dividend = 0, divisor = 0;  // S'han d'inicialitzar a zero perquè si no dona error de compilació. //<>//
  
  if (num1 >= num2) {
    dividend = num1;
    divisor  = num2;
  }
  else {
    dividend = num2;
    divisor  = num1;
  }
   
  // Controlem que el divisor no siga zero i mostrem l'error per pantalla
  if (divisor == 0) { //<>//
    text("NO ES POT DIVIDIR PER ZERO", 160, 160);
  }
  else {
    // Fem l'operació de la divisió i calculem quocient i residu.
    int quocient = dividend / divisor;
    int residu   = dividend % divisor;
    
    // Mostrem el resultat per pantalla
    text("Dividim " + dividend + " entre " + divisor, 160, 135);
    text("Quocient: " + quocient, 160, 160);
    
    if (residu == 0) 
      text("La divisió és exacta", 160, 185);
    
    else 
      text("Residu: " + residu, 160, 185);
  }
  
  delay (1000);
}
/**
* Esdeveniment mouseClicked: controla les tecles que es premen al teclat.
* @return void
*/
void mouseClicked() {
  println("(" + mouseX + "," + mouseY + ")");
}
