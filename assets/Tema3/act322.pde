/**
* Activitat 322. Major, menor o igual
* -----------------------------------------------------------
* Aquesta aplicació genera aleatòriament dos números i ens indica quin és el major, quin és el menor o si són iguals.
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
  
  // Comprovem quin és el major, quin el menor o si són iguals
  // Fixa't que l'última condició (num1<num2) no és necessària perquè ja no queden més opcions
  if (num1 == num2)
    text("num1(" + num1 + ") és igual a num2(" + num2 + ")", 160, 160);
  
  else if (num1 > num2)
    text("num1(" + num1 + ") és major que num2(" + num2 + ")", 160, 160);
    
  else  
    text("num2(" + num2 + ") és major que num1(" + num1 + ")", 160, 160); //<>// //<>//
  
  delay (1000);
}
/**
* Esdeveniment mouseClicked: controla les tecles que es premen al teclat.
* @return void
*/
void mouseClicked() {
  println("(" + mouseX + "," + mouseY + ")");
}
