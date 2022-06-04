public class MiApexClassDevConsole {
    
    public void miMetodoUno(){
        System.debug('Metodo instanciado');
    }
    
    public static void miMetodoDos(){
        System.debug('Metodo no instanciado');
    }
    
    public static void miMetodoTres(String msj){
        System.debug('Metodo con parametro '+msj);
    }
    
    public String miMetodoCuatro(String nombre){
        return 'Hola,'+nombre;
    }

}