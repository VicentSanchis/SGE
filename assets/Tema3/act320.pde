/**
* Activitat 320. Divisió de dos nombres
* -----------------------------------------------------------
* Aquesta aplicació genera dos nombres enters de forma aleatòria i fa la divisió
* entre ells dos. En acabar haurà de comprovar si la divisió és exacta (el residu és zero)
* i en cas contrari (si no és exacta) haurà de mostrar també el residu.
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
  int num1 = (int) random (100);
  int num2 = (int) random (100);
  
  int quocient = num1 / num2;
  int residu   = num1 % num2;
  
  text("Dividim " + num1 + " entre " + num2, 160, 135);
  text("Quocient: " + quocient, 160, 160);
  
  if (residu == 0) 
    text("La divisió és exacta", 160, 185);
  
  else 
    text("Residu: " + residu, 160, 185);
    
  delay (1000);
}
/**
* Esdeveniment mouseClicked: controla les tecles que es premen al teclat.
* @return void
*/
void mouseClicked() {
  println("(" + mouseX + "," + mouseY + ")");
}
