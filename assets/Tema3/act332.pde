/**
* Activitat 332. Quants dies té el mes
* -----------------------------------------------------------
* Aquesta aplicació genera aleatòriament un any entre el zero i el 2021
* i un mes entre el 1 i el 12. Després calcula els dies que té eixe mes 
* El fet d'introduir un any és important perquè els febrers dels anys
* bixestos tenen un dia més i això s'ha de tindre en compte.
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
  int anyAleatori = (int) random (0, 2021); //<>//
  
  // Generem el mes
  int mesAleatori = (int) random (0, 13);
  
  // Comprovem si l'any és bixest
  int diaExtra = 0;
  if (anyAleatori % 100 != 0) {
    if (anyAleatori % 4 == 0)
      diaExtra ++;
  }
  else {
    if (anyAleatori % 400 == 0)
      diaExtra ++;
  }
  
  switch (mesAleatori) {
    case 1:
      println ("GENER té 31 dies");
    break;
    
    case 2:
      println ("FEBRER té " + (28 + diaExtra) + " dies");
    break;
    
    case 3:
      println ("MARÇ té 31 dies");
    break;
    
    case 4:
      println ("ABRIL té 30 dies");
    break;
    
    case 5:
      println ("MAIG té 31 dies");
    break;
    
    case 6:
      println ("JUNY té 30 dies");
    break;
    
    case 7:
      println ("JULIOL té 31 dies");
    break;
    
    case 8:
      println ("AGOST té 31 dies");
    break;
    
    case 9:
      println ("SETEMBRE té 30 dies");
    break;
    
    case 10:
      println ("OCTUBRE té 31 dies");
    break;
    
    case 11:
      println ("NOVEMBRE té 30 dies");
    break;
    
    case 12:
      println ("DESEMBRE té 31 dies");
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
