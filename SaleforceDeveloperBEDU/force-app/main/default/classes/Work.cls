public with sharing class Work {
    public void NewDML() {
        Inventario__c inv7 = new Inventario__c();
        inv7.Name = 'Test 7';
        inv7.Cantidad_apart__c = '3';
        inv7.Codigo_Prod__c = 'PROD007';

        Inventario__c inv8 = new Inventario__c();
        inv8.Name = 'Test 8';
        inv8.Codigo_Prod__c = '3';
        inv8.Codigo_Prod__c = 'PROD008';

        List<Inventario__c> lst = new List<Inventario__c>();
        lst.Add(inv7);
        lst.Add(inv8);

        insert lst;
    }
}