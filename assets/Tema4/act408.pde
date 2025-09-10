/**
* Activitat 408. Copia i raona el codi
* ---------------------------------------------------------------------------------
* En aquesta activitat hem de copiar el codi que se'ns proporiciona, observar
* el que fa cada funció i canviar-les de nom amb un identificador més significatiu.
* @author Vicent Sanchis
* @since 26 de novembre del 2023
* @version 1.0
*/
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
    size(640,480);
    int i = 10;
    int [] array = new int[10];
    for (int a = 0; a < i; a ++ )
        array[a] = 0;

    println("Abans de la cirda a la funció:");
    println("i=" + i );
    println("array[5]=" + array[5] );
    modificaArray5(i,array);
    println("Després de la cirda a la funció:");
    println("i=" + i );
    println("array[5]=" + array[5] );
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. S'executa a 60Hz, és a dir, 60 vegades o frames per segonl.
* És en aquest mètode on aprofitare per fer animacions
*/
void draw () {
    delay(10000);
}
/**
* Aqusta funció bàsicament el que fa es canviar l'element en la posició 6 de l'array
* assingant-li un valor 15 a eixa posició. Dona igual el que es passe com a paràmetre i
* @param i número enter no afecta al funcionament del mètode
* @param array vector d'enters
* @return void
*/
void modificaArray5(int i, int [] array) {
    i = 5;
    array[i] = 15;
}
