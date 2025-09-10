/**
* Activitat 326. Nombre múltiples amb negatius i zeros
* -----------------------------------------------------------
* Aquesta aplicació genera aleatòriament dos nombres entre el -100 i el 100
* Després comprova quin és el major per tal de poder determinar si el menor
* és mùltiple del major, a banda també controla els casos en que els nombres siguen
* negatius o zero
* @author Vicent Sanchis
* @since  26 octubre 2023
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
  int num1 = (int) random (-100, 100);
  int num2 = (int) random (-100, 100); //<>//
  
  // Comprovem si algun dels dos nombre és negatiu
  if (num1 < 0 || num2 < 0)
    text("Un dels nombres és negatiu", 160, 110);
    
  // Comprovem quin és el millor
  int menor, major;
  
  // Comprovem quin és el menor
  if (num1 < num2) {
    menor = num1;
    major = num2;
  }
  else {
      menor = num2;
      major = num1;
  }
  
  // Només podrem fer l'operació en cas que el número menor no siga zero. 
  if (menor != 0) {
    // Finalment comprovem si els nombres són múltiples i mostrem el resultat per pantalla
    if (major % menor == 0)
      text("El nombre (" + major + ") és múltiple del nombre (" + menor + ")", 160, 160);
      
    else
      text("Els nombres (" + major + ") i (" + menor + ") no són múltiples", 160, 160);
  }
  else
    text("El nombre menor no pot ser zero ja que no es pot dividir entre zero", 160, 160);
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
