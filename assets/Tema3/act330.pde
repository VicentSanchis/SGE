/**
* Activitat 330. Dies de la setmana
* -----------------------------------------------------------
* Aquesta aplicació genera aleatòriament un dia de la setmana (número) 
* i despres diu el nom del dia: dilluns, dimarts... 
* @author Vicent Sanchis
* @since  2 novembre 2023
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
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
  clear();
  background (255);
  
  // Generem el mes aleatori
  int dia = (int) random (1, 8);   //<>//
  
  //Programa que demana un numero i diu quin mes és
  switch (dia) {  //inicio del switch
    case 1: 
      println("DILLUNS");
    break;
    
    case 2: 
      println("DIMARTS");
    break;
    
    case 3: 
      println("DIMECRES");
    break;
    
    case 4: 
      println("DIJOUS");
    break;
    
    case 5: 
      println("DIVENDRES");
    break;
    
    case 6: 
      println("DISSABTE");
    break;
    
    case 7: 
      println("DIUMENGE");
    break;
    
    default : 
      println("No vàlid");                        
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
