/**
* Activitat 334. Piràmide invertda
* -----------------------------------------------------------
* Dibuixa una piràmide invertda. La primera fila amb cinc cercles, la segona amb
* quatre, la tercera amb tres i així successivament.
* @author Vicent Sanchis
* @since  7 novembre 2023
* @version 1.0
*/
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (320, 320);
  fill (255);
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
    for (int i = 5; i > 0; i --) {
        for (int j = 0; j < i; j++ )
            circle (10+j*20, 10+i*20, 20);
    }
} //<>//
/**
* Esdeveniment mouseClicked: controla les tecles que es premen al teclat.
* @return void
*/
void mouseClicked() {
  println("(" + mouseX + "," + mouseY + ")");
}
