/**
* Activitat 501: Declara, crea i inicialitza
* ------------------------------------------------------------------------------------------------------------------
* Escriu un programa en Java utilitzant Processing IDE que permeta emmagatzemar en un array 30 enters. 
* Aquest array s'inicialitzarà element a element cridant a una funció que es dirà 'generaNumAleatori' i que tornara un enter random entre 0 i 100. 
* La funció tindrà el següent prototip: int generaNumAleatori();
* @author Vicent Sanchis
* @since 12 de desembre del 2023
* @verion 1.0
*/
// ---------------------------------------------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------------------------------------------
final static int TAM = 10;  // Grandària de l'array d'enters que hem d'emplenar
// ---------------------------------------------------------------------------------------------------------------
// Variables globals
// ---------------------------------------------------------------------------------------------------------------
int [] arrayEnters;         // Declaració de l'array d'enters.           
// ---------------------------------------------------------------------------------------------------------------
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (640, 480);
  arrayEnters = new int [TAM];  // Reservem l'espai necessari en memòria per emmagatzemar 10 enters.
  
  for (int i=0; i < TAM; i ++)
    arrayEnters [i] = generaNumAleatori ();   // Inicialitzem el vector d'enters
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. 
* S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
* És en aquest mètode on s'aprofita per fer animacions
*/
void draw() {
  clear ();
  background(255); //<>//
}
/**
* Mètode generaNumAleatori
* Aquest mètode torna un número enter entre el zero i el 100
* @return un enter entre 1 i 100
*/
int generaNumAleatori () {
  return (int) random (100);
}
