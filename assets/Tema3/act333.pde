/**
* Activitat 333. Figures geomètriques
* -----------------------------------------------------------
* Aquesta aplicació demana a l'usuari que li indique quina és la figura de la que
* vol calcular el perimetre: Triangle (t), Quadrat (q), Cercle (c) o rectangle (r)
* amb el esdeveniment de Processing keyPressed
* Una vegada ja sap quina és la figura, genera de forma aleatòria la informació
* necessària, realitza els càlculs i els mostra per pantalla.
* @author Vicent Sanchis
* @since  3 novembre 2023
* @version 1.0
*/
// Constants
final static int CERCLE = 0, TRIANGLE = 1, QUADRAT = 2, RECTANGLE = 3;

// Variables Globals 
int calculArea = -1;    // Variable que indica de que estem calculant el perimetre (CERCLE, TRIANGLE, QUADRAT O RECTANGLE)
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
  int costat, radi, base;
  
  switch (calculArea) {
    case CERCLE:
      // El perimetre del cercle és 2 * PI * radi
      radi = (int)random(100);
      println("El perimetre d'un cercle amb radi (" + radi + ") és de: " + (2 * PI * radi));
      calculArea = -1;
    break;
    
    case TRIANGLE:
      costat = (int)random(100);
      println("El perimetre d'un triangle amb costat (" + costat + ") és de: " + (3 * costat));
      calculArea = -1;
    break;
    
    case QUADRAT:
      costat = (int)random(100);
      println("El perimetre d'un quadrat amb costat (" + costat + ") és de: " + (4 * costat));
      calculArea = -1;
    break;
    
    case RECTANGLE:
      costat = (int)random(100);
      base   = (int)random(100);
      println("El perimetre d'un rectangle amb costat (" + costat + ") i base (" + base + ") és de: " + ((2 * costat) + (2 * base)));
      calculArea = -1;
    break;
    
    default:
      text("Calcul de perimetres\n(T) triangle, (C) cercle\n (Q) quadrat, (R) rectangle", 160, 120);
    break;
  }
     //<>// //<>//
  delay (1000);
}
/** 
* Esdeveniment keyPressed: controla les tecles que es premen al teclat.
* Para molta atenció a l'ús que es fa el keyPressed i les constants 
* La tendència és fer tots els càlculs así però no és funció d'un esdeveniment fer càlculs.
* @return void
*/
void keyPressed () {
  switch (key) {
    case 'T': case 't':
     calculArea = TRIANGLE;
    break;
    
    case 'Q': case 'q':
      calculArea = QUADRAT;
    break;
    
    case 'C': case 'c':
      calculArea = CERCLE;
    break;
    
    case 'R': case 'r':
      calculArea = RECTANGLE;
    break;
  }
}
/**
* Esdeveniment mouseClicked: controla les tecles que es premen al teclat.
* @return void
*/
void mouseClicked() {
  println("(" + mouseX + "," + mouseY + ")");
}
