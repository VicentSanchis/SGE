/**
 * Activitat 519. Matrius
 * ------------------------------------------------------------------------------------------------------------------
 * Projecte escrit en Processing IDE en el que tractarem els tipus compostos de dades en Java de dues dimensions.
 * Les matrius. S'han d'anar afegint funcionalitats com s'indica al tema 5
 * @author  Vicent Sanchis
 * @since   10/01/24
 * @version 1.0
 */
// ---------------------------------------------------------------------------------------------------------------
// Llibreries, imports, packages ..
// ---------------------------------------------------------------------------------------------------------------
import javax.swing.JOptionPane;
// ---------------------------------------------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------------------------------------------
final static int FILES = 3, COLUMNES=3;  // Dimensions de la nostra matriu
final static int EMPLENA1=0, EMPLENA2=1, MOSTRA=2, SUMA=4, MULT=5, PROD=6, TRASP=7, EIXIR=8;  // Opcions app
final static int DIALEG=0, OPERACIO=1;   // Dividim algunes de les operacions en dues fases amb aquestes constants
// ---------------------------------------------------------------------------------------------------------------
// Variables globals
// ---------------------------------------------------------------------------------------------------------------
int          opcio;              // Opció seleccionada la menú de l'aplicació: EMPLENA, SUMA, MULT ...
int          subFase;            // Indica la subfase DIALEG o OPERACIO d'algunes opcions del menú.
int          escalar;            // Escalar amb el que multiplicarem matrius
String  []   menu;               // Declaració de l'array del menú.
int     [][] matriu1;            // Primera matriu de l'aplicació
int     [][] matriu2;            // Segona matriu
int     [][] matriuA;            // Matriu auxiliar A per a relitzar càlculs.
int     [][] matriuB;            // Matriu auxiliar B per a relitzar càlculs.
// ---------------------------------------------------------------------------------------------------------------
/**
 * Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació.
 * Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
 * @return void
 */
void setup () {
  size (640, 480);
  inicialitzaMenu    ();   // Creem i inicialitzem el menú.
  opcio   = -1;
  subFase = -1;
  matriu1 = new int [FILES][COLUMNES];
  matriu2 = new int [FILES][COLUMNES];
  matriuA = new int [FILES][COLUMNES];
  matriuB = new int [FILES][COLUMNES];
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
  mostraMenu (50, 50);
  
  switch (opcio) {
    case EMPLENA1:
      emplenaMatriu (matriu1);
    break;
    
    case EMPLENA2:
      emplenaMatriu (matriu2);
    break;
    
    case MOSTRA:
      mostraMatriu (matriu1, 250, 50, "Matriu A");
      mostraMatriu (matriu2, 350, 50, "Matriu B");
    break;
    
    case SUMA:      
      for (int i=0; i < FILES; i++) {
        for (int j=0; j < COLUMNES; j++) {
          matriuA [i][j] = matriu1[i][j]+matriu2[i][j];
        }
      }
      
      mostraMatriu (matriu1, 250, 50, "Matriu A");
      mostraMatriu (matriu2, 350, 50, "Matriu B");
      mostraMatriu (matriuA, 450, 50, "SUMA");
    break;
    
    // Com que a la opció de multiplicació per un escalar necessitem demanar l'escalar a l'usuari,
    // hem de dividir l'operació en dues subfases: DIALEG on demanaria a l'usuari que introduira l'escalar
    // i la subFase OPERACIO en la que es mostraria per pantalla el resultat de l'operació que es faria en eixe moment
    case MULT:
      switch (subFase) {
        case DIALEG:
          escalar = obtenirEscalarDialog ();
          if (escalar == -1)
            return;
          
          subFase = OPERACIO;  // Quan ja hem demanat l'escalar ja podem canviar de subFase i fer l'operació i mostrar-ho per pantalla
        break;
        
        case OPERACIO:
          for (int i=0; i < FILES; i++) {
            for (int j=0; j < COLUMNES; j++) {
              matriuA [i][j] = matriu1[i][j] * escalar;
              matriuB [i][j] = matriu2[i][j] * escalar;
            }
          }
          
          // Mostrem per pantalla les dues matrius originals i les dues resultants
          mostraMatriu (matriu1, 250, 50, "Matriu A");
          mostraMatriu (matriu2, 350, 50, "Matriu B");
          mostraMatriu (matriuA, 450, 50, "A * " + escalar);
          mostraMatriu (matriuB, 550, 50, "B * " + escalar);
        break;
      }
    break;
    
    case PROD:
      matriuA = multiplicaMatrius (matriu1, matriu2);
      mostraMatriu (matriu1, 250, 50, "Matriu A");
      mostraMatriu (matriu2, 350, 50, "Matriu B");
      mostraMatriu (matriuA, 450, 50, "Producte");
    break;
    
    case TRASP:
      for (int i=0; i < matriuA.length; i ++) {
        for (int j=0; j < matriuA.length; j++) {
          matriuA [j][i] = matriu1 [i][j];
          matriuB [j][i] = matriu2 [i][j];
        }
      }
      
      mostraMatriu (matriu1, 250, 50, "Matriu A");
      mostraMatriu (matriu2, 350, 50, "Matriu B");
      mostraMatriu (matriuA, 450, 50, "Tr-A");
      mostraMatriu (matriuB, 550, 50, "Tr-B");
    break;
    
    case EIXIR:
      exit();
    break;
  }
}
/**
* Aquest mètode multiplica les dues matrius que es passen per paràmetre i retorna el resultat.
* @param matriuA primera matriu de l'operació del producte
* @param matriuB segona matriu de l'operació
* @return una matriu d'enters de dues dimensions com a resultat de la multiplicació de matrius que es passen per paràmetre 
*/
int [][] multiplicaMatrius (int [][] matriuA, int [][] matriuB) {
  int [][] matriuResultat = new int [matriuB.length] [matriuB[0].length];
  
  for (int a = 0; a < matriuA [0].length; a++) {
    for (int i = 0; i < matriuA.length; i++) {
      int suma = 0;
      for (int j = 0; j < matriuA[0].length; j++)
        suma += matriuA[i][j] * matriuB[j][a];
      matriuResultat[i][a] = suma;
    }
  } 
  return matriuResultat;
}
/**
* Emplena de forma aleatòria la matriu que es passa per paràmetres.
* @param matriu estructura a emplenar
* @return void
*/
void emplenaMatriu (int [][] matriu) {
  for (int i=0; i < FILES; i ++) {
    for (int j=0; j < COLUMNES; j ++) {
      matriu [i][j] = generaNumAleatori();
    }
  }
}
/**
* Mostra de forma amigable a la pantalla principal de l'aplicació la matriu que se li passa per paràmetre
* @param matriu array de dues dimensions que volem que es mostre per pantalla.
* @param x coordenada x a la que volem dibuixar la matriu.
* @param y coordenada y a la que volem dibuixar la matriu.
* @param caption text que volem que es mostre com a títol de la matriu
* @return void
*/
void mostraMatriu (int [][] matriu, int x, int y, String caption) {
  textAlign (CENTER);
  rectMode  (CENTER);
  textSize  (14);
  text      (caption, x+20, y);
  textSize  (12);
  noFill();
  
  y = y + 20;
  for (int i=0; i < matriu.length; i ++) {
    for (int j=0; j < matriu[0].length; j ++) {
      int posX = x+j*20;
      int posY = y+i*20;
      text (matriu[i][j], posX, posY+4);
      rect (posX, posY, 20, 20);
    }
  }
}
/**
 * El metode obtenir clau s'ha creat per que mostre un dialeg on l'usuari puga introduir bé un numero o un caracter.
 * @return el que s'haja introduit al diàleg en format enter.
 */
int obtenirEscalarDialog ( ) {
  int clau = -1;
  try {
    String m = JOptionPane.showInputDialog("Introduir la clau a buscar");
    clau = Integer.parseInt (m);
  }
  catch (Exception e) {
    println ("<ERROR> Clau introduida errònia.");
  }
  return clau;
}
/**
 * esdeveniment keyPressed. Controla les accions a realitzar segons les tecles que es premen
 * @return void
 */
void keyPressed () {
  subFase = DIALEG;
  switch (key) {
    case '1': opcio=EMPLENA1; break;
    case '2': opcio=EMPLENA2; break;
    case '3': opcio=MOSTRA;   break;
    case '4': opcio=SUMA;     break;
    case '5': opcio=MULT;     break;
    case '6': opcio=PROD;     break;
    case '7': opcio=TRASP;    break;
    case 'X': opcio=EIXIR;    break;
    case 'x': opcio=EIXIR;    break;
  }
}
/**
 * Mètode inicialitzaMenu: s'encarrega de reservar l'espai necessari a l'array del menú i li assigna
 * els valors inicials.
 * @return void
 */
void inicialitzaMenu () {
  menu = new String  [8]; // Reservem l'espai necessari en memòria per emmagatzemar les opcions del menú.

  // Inicialitzem els valors del menú
  menu [0]  = "1. Emplena la primera matriu";
  menu [1]  = "2. Emplena la segona matriu";
  menu [2]  = "3. Visualitza les matrius";
  menu [3]  = "4. Suma les matrius";
  menu [4]  = "5. Multiplica per un escalar";
  menu [5]  = "6. Producte de matrius";
  menu [6]  = "7. Trasposta";
  menu [7]  = "X. Eixir";
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
 * Mètode generaNumAleatori
 * Aquest mètode torna un número enter entre el zero i el 100
 * @return un enter entre 1 i 100
 */
int generaNumAleatori () {
  return (int) random (1,11);
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
