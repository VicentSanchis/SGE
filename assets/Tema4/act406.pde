/**
* Activitat 406. Copia i raona el codi
* ---------------------------------------------------------------------------------
* En aquesta activitat hem de copiar el codi que se'ns proporiciona i modificar-lo 
* per tal que funcione. Bàsicament haviem de posar les crides als diferents mètodes
* dins del draw i/o el setup tenint en compte que els paràmetres i arguments a
* la crida han de coincidir en tipus i nombre d'arguments.
* @author Vicent Sanchis
* @since 24 de novembre del 2023
* @version 1.0
*/
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
  // Crides a la funció holaMon
  holaMon("Batiste");          
  // holaMon();                   
  // holaMon("Batiste","Ceba");   

  // Crides a la funció suma
  int resultat = suma(10,5);
  suma(10,5);

  // int resultat = suma();
  // suma();
  // int res = suma (10,3,10);
  
}
/**
 * Mètode holaMon 
 * Mostra per pantalla hola + el nom que es passa com a argument
 * @param strNom cadena de caracters que representa el nom d'una persona
 * @return void
 */
void holaMon (String strNom) {
  System.out.println("Hola: " + strNom);
}
/**
 * Mètode suma
 * Retorna el valor de la suma dels elements que es passen com a arguments.
 * @param a primer element de la suma de tipus enter.
 * @param b segon element de la suma de tipus enter.
 * @return el resultat de la suma en forma entera
 */
int suma (int a, int b) {
  int res = a + b;
  return res;
}
