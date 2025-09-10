/**
* Projecte Tipus Compostos de Dades
* ------------------------------------------------------------------------------------------------------------------
* Projecte escrit en Processing IDE en el que tractarem els tipus compostos de dades en Java.
* A aquest projecte se li aniran afegint funcionalitats conforme avancem en els continguts del Tema 5
* @author  Vicent Sanchis
* @since   15/12/23
* @version 1.0
*/
// ---------------------------------------------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------------------------------------------
final static int TAM = 10;  // Grandària de l'array d'enters que hem d'emplenar
final static int ENTERS=1, CARACTERS=2, REINICIA=3, SEQUENCIAL=4, BINARIA=5, SELECCIO=6, INSERCIO=7, BOMBOLLA=8, QUICKSORT=9, SHELL=10, EIXIR=11;
// ---------------------------------------------------------------------------------------------------------------
// Variables globals
// ---------------------------------------------------------------------------------------------------------------
int       opcio;              // Determina l'acció del menú que s'està realitzant. 
int    [] arrayEnters;        // Declaració de l'array d'enters. 
char   [] arrayCaracters;     // Declaració de l'array de caracters.
String [] menu;               // Declaració de l'array del menú.
// ---------------------------------------------------------------------------------------------------------------
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (640, 480);
  inicialitzaMenu   ();            // Creem i inicialitzem el menú.
  inicialitzaArrays ();            // Inicialitzem els arrays de la nostra aplicació
  emplenaArrays     ();
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. 
* S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
* És en aquest mètode on s'aprofita per fer animacions
*/
void draw() {
  clear ();
  background (255);
  fill (0);
  mostraMenu      (50, 50);
  
  // El switch que ve a continuació controla la fase que ha escollit l'usuari.
  switch (opcio) {
    case ENTERS:
      mostraEnters(arrayEnters, 220, 50);
    break;
    
    case CARACTERS:
      mostraCaracters(arrayCaracters, 440, 50);
    break;
    
    case REINICIA:
    break;
    
    case SEQUENCIAL:
    break;
    
    case BINARIA:
    break;
    
    case SELECCIO:
    break;
    
    case INSERCIO:
    break;
    
    case BOMBOLLA:
    break;
    
    case QUICKSORT:
    break;
    
    case SHELL:
    break;
    
    case EIXIR:
    break;
  } //<>//
}
/**
* esdeveniment keyPressed. Controla les accions a realitzar segons les tecles que es premen
* @return void
*/
void keyPressed () {
  println("keyPressed: " + key);
  switch (key) {
    case '1':
      opcio = ENTERS;
    break;
    
    case '2':
      opcio = CARACTERS;
    break;
    
    case '3':
      opcio = REINICIA;
    break;
    
    case '4':
      opcio = SEQUENCIAL;
    break;
    
    case '5':
      opcio = BINARIA;
    break;
    
    case '6':
      opcio = SELECCIO;
    break;
    
    case '7':
      opcio = INSERCIO;
    break;
    
    case '8':
      opcio = BOMBOLLA;
    break;
    
    case '9':
      opcio = QUICKSORT;
    break;
    
    case 'S':
    case 's':
      opcio = QUICKSORT;
    break;
    
    case 'X':
    case 'x':
      opcio = EIXIR;
    break;
  }
}
/**
* Mètode inicialitzaArrays: s'encarrega de reservar l'espai necessari als arrays de la nostra aplicació.
* @return void.
*/
void inicialitzaArrays () {
  arrayEnters    = new int  [TAM]; // Reservem l'espai necessari en memòria per emmagatzemar 10 enters.
  arrayCaracters = new char [TAM]; // Reservem l'espai necessari en memòria per emmagatzemar 10 caracters.
}
/**
* Mètode inicialitzaMenu: s'encarrega de reservar l'espai necessari a l'array del menú i li assigna
* els valors inicials.
* @return void
*/
void inicialitzaMenu () {
  menu = new String  [11]; // Reservem l'espai necessari en memòria per emmagatzemar les opcions del menú.
  
  // Inicialitzem els valors del menú
  menu [0]  = "1. Mostrar array enters";
  menu [1]  = "2. Mostrar array caracters";
  menu [2]  = "3. Reinicialitzar vectors";
  menu [3]  = "4. Recerca seqüencial";
  menu [4]  = "5. Recerca binària";
  menu [5]  = "6. Ordenar amb selecció";
  menu [6]  = "7. Ordenar amb inserció";
  menu [7]  = "8. Ordenar amb bombolla";
  menu [8]  = "9. Ordenar amb Quicksort";
  menu [9]  = "S. Ordenar amb Shell";
  menu [10] = "X. Eixir";
}
/**
* Mètode mostraMeu: mostra el menú d'opcions de l'aplicació.
* @return void.
*/
void mostraMenu (int x, int y) {
  textAlign(LEFT);
  for (int i=0; i < menu.length; i ++) 
    text(menu[i], x, y+i*20);
}
/**
* Mètode emplenaArrays: s'encarrega d'emplenar els arrays de la nostra aplicació
* @return void.
*/
void emplenaArrays () {
  for (int i=0; i < TAM; i ++) {
    arrayEnters    [i] = generaNumAleatori  ();   // Inicialitzem el vector d'enters
    arrayCaracters [i] = generaCharAleatori ();   // Inicialitzem el vector de caracters
  }
}
/**
* Mètode mostraEnters
* Mostra l'array unidimensional que es passa per paràmetre de forma
* amigable, és a dir, agradable a la vista.
* @param array unidimensional que es vol mostrar
* @param x coordenada x on vol que es dibuixe l'array
* @param y coordenada y on vol que es dibuixe l'array
* @return void
*/
void mostraEnters (int [] array, int x, int y) {
  textAlign(CENTER);
  text ("ARRAY D'ENTERS", x+90, y-20);
  //for (int i=0; i < array.length; i ++) {
  int a = 0;
  for (int i: array) {
    int posX = x + a*20;
    text (array[a], posX, y+4);
    noFill();
    rectMode(CENTER);
    rect(posX, y, 20, 20);
    a ++;
  }
}
/**
* Mètode mostraCaracters
* Mostra l'array unidimensional que es passa per paràmetre de forma
* amigable, és a dir, agradable a la vista.
* @param array unidimensional que es vol mostrar
* @param x coordenada x on vol que es dibuixe l'array
* @param y coordenada y on vol que es dibuixe l'array
* @return void
*/
void mostraCaracters (char [] array, int x, int y) {
  textAlign(CENTER);
  text ("ARRAY DE CARACTERS", x+85, y-20);
  int a = 0;
  for (char c : array) {
    int posX = x + a*20;
    text(array[a], posX, y+4);
    noFill();
    rectMode(CENTER);
    rect(posX, y, 20, 20);
    a ++;
  }
}
/**
* Mètode generaNumAleatori
* Aquest mètode torna un número enter entre el zero i el 100
* @return un enter entre 1 i 100
*/
int generaNumAleatori () {
  return (int) random (100);
}
/**
* Mètode generaNumAleatori
* Aquest mètode torna un caracter de l'alfabet.
* Cal tenir en compte que els caracters en java al final es codifiquen com a enters basant-se en ASCII. 
* És a dir, la 'a' en realitat és el 97 i la 'z' el 122
* @return un caracter en minúscules
*/
char generaCharAleatori () {
  return (char) random (97, 122);  // En aquesta instrucció estic demanant que la funció random em done un caracter entre la 'a' i la 'z'
}
