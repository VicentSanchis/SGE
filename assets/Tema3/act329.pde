/**
* Activitat 329. Mesos i estacions
* -----------------------------------------------------------
* Aquesta aplicació genera aleatòriament un mes (número) i despres diu
* el nom del mes i l'estació en la que es troba eixe mes (el primer dia del mes)
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
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
  clear();
  background (255);
  
  // Generem el mes aleatori
  int mesAleatori = (int) random (1, 13);   //<>//
  
  //Programa que demana un numero i diu quin mes és
  switch (mesAleatori) {  //inicio del switch
    case 1: 
      println("GENER (Hivern)");
    break;
    
    case 2: 
      println("FEBRER (Hivern)");
    break;
    
    case 3: 
      println("MARÇ (Primavera)");
    break;
    
    case 4: 
      println("ABRIL (Primavera)");
    break;
    
    case 5: 
      println("MAIG (Primavera)");
    break;
    
    case 6: 
      println("JUNY (Estiu)");
    break;
    
    case 7: 
      println("JULIOL (Estiu)");
    break;
    
    case 8: 
      println("AGOST (Estiu)");
    break;
    
    case 9: 
      println("SETEMBRE (Tardor)");
    break;
    
    case 10: 
      println("OCTUBRE (Tardor)");
    break;
    
    case 11: 
      println("NOVEMBRE (Tardor)");                                                         
    break;
    
    case 12: 
      println("DESEEMBRE (Hivern)");
    break;
    
    default : println("No vàlid");                        
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
