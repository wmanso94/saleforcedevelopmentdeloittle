public class MyInterface implements InterfacePractice {
    public void metodo1() {
        system.debug('First Implementation');
    }

    public string metodo2() {
        system.debug('Second Implementation');
        return 'This is Second Implementation';
    }

    public void metodo3(string param1) {
        system.debug(param1);

    }

}
