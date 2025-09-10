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
// Llibreries, imports, packages ..
// ---------------------------------------------------------------------------------------------------------------
import javax.swing.JOptionPane;
// ---------------------------------------------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------------------------------------------
final static int TAM = 10;  // Grandària de l'array d'enters que hem d'emplenar
final static int ENTERS=1, CARACTERS=2, REINICIA=3, SEQUENCIAL=4, BINARIA=5, SELECCIO=6, INSERCIO=7, BOMBOLLA=8, QUICKSORT=9, SHELL=10, EIXIR=11, EFICIENCIA=12;
final static int INICI=1, WARNING=2, MOSTRA=3;
// ---------------------------------------------------------------------------------------------------------------
// Variables globals
// ---------------------------------------------------------------------------------------------------------------
int        opcio;              // Determina l'acció del menú que s'està realitzant.
int        posicio;            // Determina la posició en la que es troba la clau quan busquem.
int        subFase;            // Determina si estem en la subfase de recerca: INICI, WARNING o MOSTRA
int        accesSeq, accesBin; // Comptadors globals dels accessos que es fan als algorismes de recerca
int     [] arrayEnters;        // Declaració de l'array d'enters. 
char    [] arrayCaracters;     // Declaració de l'array de caracters.
String  [] menu;               // Declaració de l'array del menú.
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
  posicio  = -1;
  subFase  = INICI;
  accesSeq = 0;
  accesBin = 0;
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
      emplenaArrays ();
    break;
    
    case SEQUENCIAL:
      mostraEnters (arrayEnters, 220, 50);
      executaSequencial ();
    break;
    
    case BINARIA:
      mostraEnters (arrayEnters, 220, 50);
      executaBinaria (); //<>//
    break;
    
    case EFICIENCIA:
      mostraEnters (arrayEnters, 220, 50); 
      comparaEficiencies ();
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
  }
}
/** 
* Realitza una recerca seqüencial sobre l'array de la clau que es passa per paràmetre
* @parem array d'enters 
* @param clau enter que estem buscant a l'array
*/
int sequencial (int [] array, int clau) {
  for (int i = 0; i < array.length; i ++ ) 
    if (array[i] == clau ) {
      accesSeq ++;
      return i;
    }
    
  return -1;
}
/**
* Realitza una recerca seqüencial sobre l'array de la clau que es passa per paràmetre
* @parem array d'enters 
* @param clau enter que estem buscant a l'array
*/
int binaria (int [] array, int clau) {
  int posCentre, posInici, posFinal, valorCentral;
  
  posInici  = 0;
  posFinal  = array.length - 1;
  
  while (posInici <= posFinal) {
    posCentre = (posInici+posFinal)/2;
    valorCentral = array [posCentre];
    accesBin ++;
    
    if (clau == valorCentral)
      return posCentre;
      
    else if (clau < valorCentral)
      posFinal = posCentre - 1;
      
    else
      posInici = posCentre + 1;
  }
  return -1;
}
/**
* Donat un array d'enters aquest algorisme compara les eficiències de la recerca seqüencial i binària. 
* Busca tots els elements de l'array amb els dos procediments i treu una mitjana dels accessos que fan cadascun
* @return void
*/
void comparaEficiencies () {
  
  switch (subFase) {
    case INICI:
      for (int i=0; i < arrayEnters.length; i ++) {
        int clau = arrayEnters [i];
        sequencial (arrayEnters, clau);
        binaria (arrayEnters, clau); 
      }
      subFase = MOSTRA;
      
    break;
    
    case MOSTRA:
      rectMode(CORNER);
      rect(210, 70, 200, 100);
      textAlign (LEFT);
      text ("Recerca Sequencial", 230, 85);
      text ("----------------------------", 230, 95);
      text ("   * Accessos: " + accesSeq, 230, 112);
      
      text ("Recerca Binària", 230, 135);
      text ("----------------------------", 230, 145);
      text ("   * Accessos: " + accesBin, 230, 157);
      
    break;
  }
}
/**
* El procediment de recerca seqüencial està dividit en dues fases: una primera on demane la cla i la busque i la segona on mostre els resultats.
* A la primera fase es demana el número que es vol buscar amb un dialeg de l'API de Java i es comprova que el que s'ha introduït és un número.
* A la segona fase es mostren els resultats
* @return void
*/
void executaSequencial () {
  int aBuscar = -1;
  textSize(14);
  
  switch (subFase) {
    case INICI:
      aBuscar = obtenirClauDialog ();
      
      if (aBuscar != -1) {
        posicio = sequencial (arrayEnters, aBuscar);
        subFase = MOSTRA;
      }
      else
        subFase = WARNING;
    break;
    
    case WARNING:
      text ("Has d'introduir un número enter", 320, 80);
    break;
    
    case MOSTRA:
      if (posicio != -1)
        text ("Clau trobada la posició " + (posicio + 1), 320, 80);
        
      else
        text ("Valor no trobat", 320, 80); 
    break;
  } //<>//
}
/**
* El procediment de recerca binària està dividit en tres fases: la primera comprova que l'array estiga ordenat,
* la segona demana la clau a buscar i la tercera on mostren els resultats.
* @return void
*/
void executaBinaria () {
  textSize(14);
  int aBuscar = -1;             // Si aBuscar és menys 1 significa que no s'ha introduit un número
  
  if (!estaOrdenat(arrayEnters)) {         
    text ("Per fer la rercerca binària\nl'array ha d'estar ordenat", 320, 240);
    return;
  }
  
  switch (subFase) {
    case INICI:
      aBuscar = obtenirClauDialog ();
      
      if (aBuscar != -1) {
        posicio = sequencial (arrayEnters, aBuscar);
        subFase = MOSTRA;
      }
      else
        subFase = WARNING;
    break;
    
    case WARNING:
      text ("Has d'introduir un número enter", 320, 80);
    break;
    
    case MOSTRA:
      if (posicio != -1)
        text ("Clau trobada la posició " + (posicio + 1), 320, 80);
        
      else
        text ("Valor no trobat", 320, 80); 
    break;
  }
}
/**
* El metode obtenir clau s'ha creat per que mostre un dialeg on l'usuari puga introduir bé un numero o un caracter.
* @return el que s'haja introduit al diàleg en format enter.
*/
int obtenirClauDialog ( ) {
  int clau = -1;
  try {
    String m = JOptionPane.showInputDialog("Introduir la clau a buscar");
    clau = Integer.parseInt (m); //<>//
  }
  catch (Exception e) {
    println ("<ERROR> Clau introduida errònia."); //<>//
  }
  return clau;
}
/**
* Comprova si l'array que es passa per paràmetre està ordenat ascendentment.
* @return true si l'array que es passa com a argument està ordenat, false en cas contrari.
*/
boolean estaOrdenat (int [] array) {
  for (int i=0; i < array.length-1; i ++) 
    if (array [1] > array [i+1])
      return false;
  
  return true;
}
/**
* esdeveniment keyPressed. Controla les accions a realitzar segons les tecles que es premen
* @return void
*/
void keyPressed () {
  accesSeq = 0;
  accesBin = 0;
  subFase = INICI;
  
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
    
    case 'C':
    case 'c':
      opcio = EFICIENCIA;
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
  menu = new String  [12]; // Reservem l'espai necessari en memòria per emmagatzemar les opcions del menú.
  
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
  menu [10] = "C. Compara eficiències";
  menu [11] = "X. Eixir";
}
/**
* Mètode mostraMeu: mostra el menú d'opcions de l'aplicació.
* @return void.
*/
void mostraMenu (int x, int y) {
  textSize (12);
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
  
  // Per a proves amb la recerca binària
   arrayEnters [0] = 1;
   arrayEnters [1] = 2;
   arrayEnters [2] = 3;
   arrayEnters [3] = 4;
   arrayEnters [4] = 5;
   arrayEnters [5] = 6;
   arrayEnters [6] = 7;
   arrayEnters [7] = 8;
   arrayEnters [8] = 9;
   arrayEnters [9] = 10;
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
  textSize (12);
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
  textSize (12);
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

void mouseClicked () {
  println("(" + mouseX + "," + mouseY + ")");
}
