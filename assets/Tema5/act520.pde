/**
 * Activitat 520. Alumnes i assignatures.
 * ------------------------------------------------------------------------------------------------------------------
 * Imagina que has de mantindre les notes dels alumnes de tres assignatures. 
 * A cada assignatura tens 15 alumnes, és a dir, l'estructura que emmagatezemarà aquesta informació haurà de ser
 * un array de 3 files (assignatures) i 15 columnes (alumnes).  Amb aquesta estructura haurem de poder fer les 
 * següents operacions: Inserir notes d'una assignatura, de totes, calcular la mitjana per assignatura
 * ordenar les assignatures i treure estadístiques. La part més complicada d'aquesta activitat és que el resultat 
 * d'algunes operacions seran també estructures complexes.
 * @author  Vicent Sanchis
 * @since   15/01/24
 * @version 1.0
 */
// ---------------------------------------------------------------------------------------------------------------
// Llibreries, imports, packages ..
// ---------------------------------------------------------------------------------------------------------------
import javax.swing.JOptionPane;
// ---------------------------------------------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------------------------------------------
final static int ASSIGNATURES = 3, ALUMNES=15;             // Dimensions matriu, 3 assignatures i 15 alumnes
final static int INSERIR_UNA=0, INSERIR_ALL=1, MITJANA=2;  // Fases
final static int ORDENAR=3, ESTADISTICA=4, EIXIR=5;        // Fases
final static int OPCIONSMENU = 6;                          // Nombre total d'opcions que té el menú
// ---------------------------------------------------------------------------------------------------------------
// Variables globals
// ---------------------------------------------------------------------------------------------------------------
int opcioMenu;
// ---------------------------------------------------------------------------------------------------------------
// Estructures compostes
// ---------------------------------------------------------------------------------------------------------------
String [] menu;                    // Array on estaran les opcions del menú
//float [][] matriuNotes;            // Array on es guardaran les notes
float [][] mitjanes;               // Array on es guardaran les mitjanes de les assignatures
float [][] matriuEstadistiques;    // Array on es guardaran les estadístiques

//float [][] matriuNotes = {{4,4,4,4,4,4,4,4,4,4,4,4,4,4,4},{7,7,7,7,7,7,7,7,7,7,7,7,7,7,7},{2,2,2,2,2,2,2,2,2,2,2,2,2,2,2}};
float [][] matriuNotes = {{4.4,1,7,3.1,8,10,3,4.3,5,4,6,3.2,2,9,4},{7.1,7.5,4.3,2.2,2.7,2.5,7.3,10,9.8,8,7,6.1,6.3,7,7},{1,3,2,1,6,4,5,2,3,8,5,2,4,2,3}};
// ---------------------------------------------------------------------------------------------------------------
/**
 * Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació.
 * Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
 * @return void
 */
void setup () {
  size (640, 480);
  inicialitzaMenu        ();   // Creem i inicialitzem el menú.
  //inicialitzaMatriuNotes ();   // Posem tots els valor a -1

  opcioMenu = -1;
  
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
  
  // Independentment de l'opció que triem al nostre menú ha d'estar sempre visible igual que la matriu de notes
  mostraMenu (50, 50);  
  mostraMatriuNotes (matriuNotes, 90, 180, "NOTES");
  
  switch (opcioMenu) {
    case INSERIR_UNA:
      inserirUnaNota ();
    break;
    
    case INSERIR_ALL:
      inserirTotesLesNotes ();
    break;
    
    case MITJANA:
      calculaMitjana ();
      mostraMitjanes ();
    break;
    
    case ORDENAR:
      ordenaDescendentment ();
    break;
    
    case ESTADISTICA:
      calculaEstadistiques ();
      mostraMatriuEstadistiques();
    break;
    
    case EIXIR:
      exit ();
    break;
  }
}
/**
* Inserir una nota primer demana quina l'assignatura (1, 2 o 3) i després demana la nota que es vol introduir
* @return void
*/
void inserirUnaNota () {
  int numAssig = obtenirValorPrompt ("Tria assignatura (1,2,3)", 1, 3);   //<>//
  if (numAssig == -1)  // Si premem el botó cancelar o introduim una assignatura incorrecta 
    opcioMenu = -1;
    
  else if (numAssig == -2) {
    JOptionPane.showMessageDialog(null, "Has d'introduir un número d'assignatura correcte");
    opcioMenu = -1;
  }
  else {
    float nota = -1;
    // Comprovem si queda algun hueco lliure, si no hi ha mostrem error per pantalla.
    int primeraLliure = obtindrePrimeraLliure(numAssig-1, matriuNotes);   
    if (primeraLliure == -1) {
      JOptionPane.showMessageDialog(null, "Ja estan totes les notes introduides");
      opcioMenu = -1;
    }
    else {
      nota = obtenirValorPrompt ("Posa la nota (0-10)", 0, 10);
      if (nota == -1) {  // Després demanem la nota. Si prremem cancelar tornem a l'inici i si el valor no és correcte ho mostrem
        opcioMenu = -1;
      }
      else if (nota == -2) {
        JOptionPane.showMessageDialog(null, "Has d'introduir un número d'assignatura correcte");
        opcioMenu = -1;
      }
      else {
        matriuNotes [numAssig-1][primeraLliure] = nota;
        opcioMenu = -1;
      }
    }
  } 
}
/**
* Aquesta opció recorre la matriu d'assignatures i va posant nota a nota
* @return void
*/
void inserirTotesLesNotes () {
  for (int i=0; i < ASSIGNATURES; i++) {
    for (int j=0; j < ALUMNES; j ++) {
      String strCaption = "Assignatura " + (i+1) + ".\n Introdueix la nota " + (j+1);
      float nota = obtenirValorPrompt (strCaption, 0, 10);
      if (nota == -2)
        JOptionPane.showMessageDialog(null, "Has d'introduir una nota entre el 1 i el 10");
        
      else if (nota == -1) {
        opcioMenu = -1;
        return;
      }
      else
        matriuNotes [i][j] = nota;
    }
  }
}
/**
* Recorre les notes de totes les assignatures, calcula la mitjana i ho mostra per pantalla. 
* La qüestió d'aquest apartat és que el resultat de l'operació és una estructura complexa
* concretament un array de tres decimals on es guardaran les mitjanes de les tres assignatures.
* @return void
*/
void calculaMitjana () {
  mitjanes = new float [ASSIGNATURES][2];
  mitjanes [0][0] = 1;
  mitjanes [1][0] = 2;
  mitjanes [2][0] = 3;
  
  for (int i=0; i < ASSIGNATURES; i ++) {
    for (int j=0; j < ALUMNES; j ++) {
      if (matriuNotes [i][j] >= 0)
        mitjanes [i][1] += matriuNotes [i][j];
    }
    mitjanes [i][1] = mitjanes [i][1] / ALUMNES;
  }
}
/**
* Per a cada assignatura ordena les notes a l'array de menor a major
* @return void
*/
void ordenaDescendentment () {
  for (int i=0; i < ASSIGNATURES; i ++) {
    ordena (matriuNotes [i]);   
  }
}
/**
* Per a cada assignatura aquest mètode compta la quantitat de notes entre (0-4) suspès, (4-5) quasi, (5-7) bé, (7-9) notable i (9-10) excel·lent
* Cal tenir en compte que el resultat d'aquest mètode serà una matriu de 3 files (assignatures) per 5 columnes (rangs de notes)
* La matriu seria de la següent forma:
* fil0 Assignatura1, fil1 Assignatura2, fil2 Assignatura3
* col0 (0-4), col1 (4-5), col2 (5-7), col3 (7-9), col4 (9-10)
* @return void matriuEstadistiques és una variable global
*/
void calculaEstadistiques () {
  matriuEstadistiques = new float [ASSIGNATURES][5];
  
  for (int i=0; i < ASSIGNATURES; i++) {
    for (int j=0; j < ALUMNES; j++) {
      float nota = matriuNotes[i][j];
      
      if (nota < 4)
        matriuEstadistiques[i][0] ++;
      
      else if (nota < 5) 
        matriuEstadistiques[i][1] ++;
        
      else if (nota < 7) 
        matriuEstadistiques[i][2] ++;
        
      else if (nota < 9) 
        matriuEstadistiques[i][3] ++;
        
      else 
        matriuEstadistiques[i][4] ++;
    }
  }
}
/**
* S'encarrega de buscar la primera posició lliure per a l'assignatura 'numAssig' a l'array de les notes 'array'
* @param número de l'assignatura: 1, 2 o 3
* @param array matriu de dues dimensions amb les notes de l'activitat
* @return la primera posició lliure a l'array o -1 en cas de no haver posicions lliures
*/
int obtindrePrimeraLliure (int numAssig, float [][] array) {
  for (int i=0; i < ALUMNES; i ++) 
    if (array[numAssig][i] == -1)
      return i;
      
  return -1;
}
/**
* Algoritme d'ordenació per selecció
* @param array conjunt de nombres que es vol ordenar
* @return void
*/
void ordena (float [] array) {
  for(int i = 0; i < ALUMNES-1 ; i++) {
    int posMinim = i;
    for(int j = i + 1 ; j < ALUMNES ; j++) {
      if(array[j] < array[posMinim]) {
        posMinim = j;
      }
    }
    float aux = array[i];
    array[i] = array[posMinim];
    array[posMinim] = aux;
  }
}
/**
* Ordena de menor a major les assignatures en base a la mitjana de les notes
* S'HA DE FER AMB UNA MATRIU, PRIMER FILA NÚMERO ASSIG I SEGONA FILA NOTA MITJANA
* @return void
*/
// ---------------------------------------------------------------------------------------------------------------
// Esdeveniments de l'API de Processing IDE
// ---------------------------------------------------------------------------------------------------------------
/**
 * esdeveniment keyPressed. Controla les accions a realitzar segons les tecles que es premen
 * @return void
 */
void keyPressed () {
  switch (key) {
    case '1': opcioMenu=INSERIR_UNA; break;
    case '2': opcioMenu=INSERIR_ALL; break;
    case '3': opcioMenu=MITJANA;     break;
    case '4': opcioMenu=ORDENAR;     break;
    case '5': opcioMenu=ESTADISTICA; break;
    case '6': opcioMenu=EIXIR;       break;
  }
}
// ---------------------------------------------------------------------------------------------------------------
// Procediments auxiliars, útils i altres.
// ---------------------------------------------------------------------------------------------------------------
/**
* Al iniciar-se l'aplicació tots els elements de la nostra matriu tindran valor -1
* No podem usar el zero perquè zero és un valor de nota vàlid
* Aquest mensy 1 també ens vindrà bé per saber quines notes ja s'han introduit i quines no.
* @return void
*/
void inicialitzaMatriuNotes () {
  matriuNotes = new float [ASSIGNATURES][ALUMNES];
  for (int i=0; i < ASSIGNATURES; i ++) {
    for (int j=0; j < ALUMNES; j ++) {
      matriuNotes [i][j] = -1;           
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
void mostraMatriuNotes (float [][] matriu, int x, int y, String caption) {
  textAlign (CENTER);
  rectMode  (CENTER);
  textSize  (12);
  text      (caption, x-20, y-4);
  textSize  (12);
  noFill();
  
  for (int i=0; i < matriu.length; i ++) {
    text("Assignatura " + (i+1), x, y+25+i*30);
    
    for (int j=0; j < matriu[0].length; j ++) {
      float num = 0;
      int posX = x+j*30+60;  
      int posY = y+i*30+20;
      
      num = matriu [i][j];
      if (num < 0)
        text("-", posX, posY+4);
      
      else
        text (nf(num,0,2), posX, posY+4);
      
      rect (posX, posY, 30, 30);
    }
  }
  
  line(x-35,y+111,x+500,y+111);
}
/**
* Mostra a la pantalla de l'aplicació les mitjanes de les notes de cada assignatura
* @return void
*/
void mostraMitjanes () {
  textAlign (LEFT);
  text("Mitjana Assignatura 1: " + mitjanes [0][1], 55, 350);
  text("Mitjana Assignatura 2: " + mitjanes [1][1], 55, 370);
  text("Mitjana Assignatura 3: " + mitjanes [2][1], 55, 390);
}
/**
* Mostra per la pantalla de l'aplicació les estadístiques de la matriu de notes
* @param matriuEstadistiques és la matriu amb les estadístiques ja calculades.
* @return void
*/
void mostraMatriuEstadistiques () {
  textAlign (LEFT);
  text("ESTADIÍSTIQUES", 155, 350);
  text("Assignatura 1:", 55, 380);
  text("Assignatura 2:", 55, 400);
  text("Assignatura 3:", 55, 420);
  text("SUS", 132, 365);
  text("QUA", 155, 365);
  text("BÉ", 185, 365);
  text("NOT", 207, 365);
  text("EXC", 233, 365);
  for(int i=0; i < ASSIGNATURES; i++) {
    for (int j=0; j < 5; j ++) {
      text (nf(matriuEstadistiques[i][j],0,1), 135+25*j, 380+i*20);
    }
  }
}
/**
 * Mètode inicialitzaMenu: s'encarrega de reservar l'espai necessari a l'array del menú i li assigna
 * els valors inicials.
 * @return void
 */
void inicialitzaMenu () {
  menu = new String  [OPCIONSMENU]; // Reservem l'espai necessari en memòria per emmagatzemar les opcions del menú.

  // Inicialitzem els valors del menú
  menu [0]  = "1. Inserir una nota de l'assignatura sel·leccionada.";
  menu [1]  = "2. Inserir totes les notes";
  menu [2]  = "3. Calcular la nota mitjana de les assignatures";
  menu [3]  = "4. Ordenar les notes de forma ascendent";
  menu [4]  = "5. Estadística";
  menu [5]  = "X. Eixir";
}
/**
 * Mètode mostraMeu: mostra el menú d'opcions de l'aplicació.
 * @return void.
 */
void mostraMenu (int x, int y) {
  textSize (12);
  textAlign(LEFT);
  text ("TRIA UNA OPCIÓ", x, y-20);
  line(x,y-15,x+280,y-15);
  for (int i=0; i < menu.length; i ++)
    text(menu[i], x, y+i*20);
    
  line(x,y+107,x+540,y+107);
}
/**
 * El metode obtenir clau s'ha creat per que mostre un dialeg on l'usuari puga introduir bé un numero o un caracter.
 * El dialeg d'entrada de dades té un requadre i dos botons: el d'acceptar i el de cancel·lar. Si es prem el botó
 * acceptar es tornarà com a valor introduit al requadre i si es prem cancelar es tornaria a la pantalla inicial.
 * @param caption text que es mostrarà al diàleg
 * @param min el valor mínim que l'usuari pot escriure
 * @param max el valor màxim que l'usuari pot triar
 * @return el que s'haja introduit al diàleg en format enter -1: cancel, -2 error, de min a max valor vàlid.
 */
int obtenirValorPrompt (String caption, int min, int max) {
  int num = -2;
  String input;
  
  try {
    do {
      input = JOptionPane.showInputDialog(caption);
      
      if ( input == null ) 
        num = -1;
        
      else {
        num = Integer.parseInt (input);
        if ( num < min || num > max)
          num = -2;
      }
    }
    while ((num < min || num > max) && num != -1 && num != -2);
  }
  catch (Exception e) {
    println ("<ERROR> El número introduit no és correcte");
    num = -2;
  }
  println("Torne: " + num);
  return num;
}
