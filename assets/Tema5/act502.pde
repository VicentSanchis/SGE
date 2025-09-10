/** //<>//
* Activitat 502: Array de caracters
* ------------------------------------------------------------------------------------------------------------------
* Millora el codi anterior. 
* Afegeix un array que puga emmagatzemar 10 caracters i inicialitza-lo amb un altre mètode que es dirà: 'generaCharAleatori()'. 
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
int  [] arrayEnters;        // Declaració de l'array d'enters.
char [] arrayCaracters;     // Declaració de l'array de caracters.
// ---------------------------------------------------------------------------------------------------------------
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (640, 480);
  arrayEnters    = new int  [TAM]; // Reservem l'espai necessari en memòria per emmagatzemar 10 enters.
  arrayCaracters = new char [TAM]; // Reservem l'espai necessari en memòria per emmagatzemar 10 caracters.
  
  for (int i=0; i < TAM; i ++) {
    arrayEnters    [i] = generaNumAleatori  ();   // Inicialitzem el vector d'enters
    arrayCaracters [i] = generaCharAleatori ();   // Inicialitzem el vector de caracters
  }
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. 
* S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
* És en aquest mètode on s'aprofita per fer animacions
*/
void draw() {
  clear (); //<>//
  background(255);
} //<>//
/**
* Mètode generaNumAleatori
* Aquest mètode torna un número enter entre el zero i el 100
* @return un enter entre 1 i 100
*/
int generaNumAleatori () {
  return (int) random (100);
}
/**
* Mètode generaCharAleatori
* Aquest mètode torna un caracter a l'atzer entre 'a' i 'z'
* @return un caracter en minúscula
*/
char generaCharAleatori () {
  return (char) random (97, 122);  // A la taula ASCII la 'a' es correspon amb 97 i 'z' 122
}
