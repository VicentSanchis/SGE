/**
* Activitat 331. Passar d'if a switch
* -----------------------------------------------------------
* Aquesta aplicació genera aleatòriament un any entre el 0 i el 2500
* Després comprova la diferència entre els dos i mostra per pantalla
* els anys que falten per arribar a l'aleatori o els que han passat
* Aquesta activitat s'ha de fer amb swich - case
* @author Vicent Sanchis
* @since  2 novembre 2023
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
  
  // El problema en aquesta activitat és que es poden donar 3 resultats:
  // - Que siga el mateix any.
  // - Qus siga menor
  // - Que siga major.
  int diferencia = ANYACTUAL - anyAleatori;
  
  if (diferencia < 0)
    diferencia = -1;
    
  else if (diferencia > 0)
    diferencia = 1;
    
  switch (diferencia) {
    case 0:
      text ("L'any aleatori i l'actual són el mateix any", 160, 160);
    break;
    
    case 1:
      text ("Falten " + (anyAleatori - ANYACTUAL) + " per arribar a " + anyAleatori, 160, 160);
    break;
    
    case -1:
      text ("Han passat " + (ANYACTUAL - anyAleatori) + " anys des del " + anyAleatori, 160, 160);
    break;
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
