/**
* Activitat 324. Millora la diferència d'anys
* -----------------------------------------------------------
* Aquesta aplicació genera aleatòriament un any entre el 0 i el 2500
* Després comprova la diferència entre els dos i mostr per pantalla
* els anys que falten per arribar a l'aleatori o els que han passat
* També ha de controlar els casos en que falte un any o haja passat un any
* @author Vicent Sanchis
* @since  24 octubre 2023
* @version 1.0
*/
// Constants
final static int ANYACTUAL = 2023;
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
  int anyAleatori = (int) random (2500);
  
  // Comprovem si l'any aleatori és anterior, posterior o igual a l'any actual
  if (anyAleatori == ANYACTUAL)
    text ("L'any aleatori i l'actual són el mateix any", 160, 160);
  
  // Si només ha passat un any des de l'any aleatori fins avuí  
  else if (anyAleatori < ANYACTUAL && (ANYACTUAL-anyAleatori) == 1)
    text ("Ha passat un any des del " + anyAleatori, 160, 160);
    
  // Si han passat més d'un any des de l'any aleatori
  else if (anyAleatori < ANYACTUAL)
    text ("Han passat " + (ANYACTUAL - anyAleatori) + " anys des de l'any " + anyAleatori, 160, 160);
   
  // Si encara falta un any per arribar a l'any aleatori
  else if (anyAleatori > ANYACTUAL && (anyAleatori-ANYACTUAL) == 1)
    text ("Falta exactament un any per arribar a l'any " + anyAleatori, 160, 160);
  
  // Si falta més d'un any per arribar a l'any aleatori.
  else
    text ("Falten " + (anyAleatori - ANYACTUAL) + " per arribar a " + anyAleatori, 160, 160); //<>//
  
  delay (1000);
}
/**
* Esdeveniment mouseClicked: controla les tecles que es premen al teclat.
* @return void
*/
void mouseClicked() {
  println("(" + mouseX + "," + mouseY + ")");
}
