system.debug('Hola mundo');
String str;
Integer i = 0;
boolean check = true;
List<String> strList;
Set<String> s;
Map<ID,String> m;
 this.test = 'Adios';
if(i > 0){
    this.test = 'es mayor';
} else {
    this.test = 'es cero o menor';
}
switch on i {
    when 2 {
        System.debug('when block 2');
    }
    when -3 {
         System.debug('when block -3');
    }
    when else {
         System.debug('default');
    }
}
integer testWhile = 0;
while(testWhile < 5){
    System.debug('Prueba '+testWhile);
    testWhile++;
}
testWhile = 5;
do{
   System.debug('Prueba '+testWhile);
   testWhile++;
}while(testWhile < 5);
Account acc = new Account();
Account acc2 = new Account();
Inventario__c inv = new Inventario__c();
inv.Name = 'Test';
inv.Cantidad_apart__c = 3;
insert inv;
List<sObject> lst = new List<sObject>();
lst.add(inv);
lst.add(acc);
String nameInv = 'Test';
Inventario__c inv2 = [SELECT id, Name from Inventario__c WHERE Name = :nameInV LIMIT 1];
sObject inv3 = [SELECT id, Name from Inventario__c WHERE Name = :nameInV LIMIT 1];
List<sObject> lst2 = [SELECT id, Name from Inventario__c WHERE Name = :nameInV];
//Test
for(integer k = 0; k <= lst2.size(); k++){
    System.debug('Result:'+lst2);
    Inventario__c inv4 = (Inventario__c)lst2[k];
    System.debug('Result:'+inv4.Name);
}
/*
for(Account test:listAccount){
}
*/
}