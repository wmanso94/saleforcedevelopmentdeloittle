public with sharing class QuotationHelper {
    public void initialConfig() {

        Account acc = new Account();
        acc.Name = 'Compumundo';
        //insert inv;
        Account acc2 = new Account();
        acc2.Name = 'Compuworld';
        //insert inv2;
        List<Account> lst = new List<Account>();
        lst.add(acc);
        lst.add(acc2);
        insert lst;
    }

    public void productsInInventory(){
        /*string nameInv = 'Invent0001';
		Inventario__c inv = [SELECT Name, Codigo_Prod__c FROM Inventario__c WHERE Name = :nameInv LIMIT 1];
        sObject inv2 = [SELECT Name, Codigo_Prod__c FROM Inventario__c WHERE Name = :nameInv LIMIT 1];
        List<sObject> lst2 = [SELECT Name, Codigo_Prod__c FROM Inventario__c WHERE Name = :nameInv];*/

        //Inventario__c[] inv = [SELECT id,Name,Codigo_Prod__c,Cantidad_dis__c,Cantidad_apart__c FROM Inventario__c WHERE Name = 'Invent0001'];
        //Inventario__c[] inv2 = [SELECT id,Name,Codigo_Prod__c,Cantidad_dis__c,Cantidad_apart__c FROM Inventario__c WHERE Name = 'Invent0002'];
        List<Inventario__c> lst = [SELECT id,Name,Codigo_Prod__c,Cantidad_dis__c,Cantidad_apart__c FROM Inventario__c LIMIT 200];
		//System.debug(inv);
        //System.debug(inv2);
        System.debug(lst);
    }
}