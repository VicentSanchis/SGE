/**
* Activitat 407. Copia i raona el codi
* ---------------------------------------------------------------------------------
* En aquesta activitat hem de copiar el codi que se'ns proporiciona i cridar a
* les funcions que s'han definit al codi.
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
    size(640,480);
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
    fesAlgo ();
    f2      (7);
    funcio3 (10, 'b');
    funcio4 (14);
    funcio5 ("Hola");
}
/**
* Mètode fesAlgo
* Escriu per pantalla "Algo faré" no necessita arguments i no retorna res.
*/
void fesAlgo() {
    println("Algo faré");
}
/**
* Mètode f2
* Determina i escriu per pantalla si l'enter que es passa per paràmetre és parell o senar
* @param a número enter que comprova si es parell o no.
* @return void
*/
void f2(int a) {
    if (a%2==0)
        println("El nombre és parell");
    else
        println("El nombre no és parell");
}
/**
* Mètode funcio3
* Determina i escriu per pantalla quin es el caracter i el numero que es passen
* per paràmetre
* @param a número enter
* @param c caracter qualsevol
* @return void
*/
void funcio3(int a, char c) {
    println("El caracter és " + c + " mentre que el número és: " + a);
}
/**
* Mètode funcio4
* Fa calculs amb un bucle de l'enter que se li passa per paràmetre.
* @param c número enter per fer els càlculs.
* @return el resultat de l'operació sobre l'argument
*/
int funcio4(int c) {
    int a = 0;
    for (int i=0; i < c; i ++)
        a = a + 1 + 2*a;

    return a;
}
/**
* Mètode funcio5
* Passa a majúscules la cadena que es passa com a paràmetre.
* @param str Cadena a convertir en majúscules
* @return la cadena "majusculitzada"
*/
String funcio5(String str) {
    if (str == "" )
        return "Buida";

    return str.toUpperCase();
}
