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

    public List<Inventario__c> productsInInventory(){
        return [SELECT id,Name FROM Inventario__c LIMIT 200];

    }

    public boolean confirmProductExistByCode(String code){

        if (null != [SELECT ExternalId
                     FROM Product2
                     WHERE ProductCode = :code]){
            return True;
        }else{
            return False;
        }
    }

    public void searchProductByCode(String code){
        
        List<Inventario__c> CantDis = [SELECT Cantidad_dis__c FROM Inventario__c WHERE Codigo_Prod__c = :code];
        
        if(CantDis != null){
            
            system.debug(CantDis);
                
        }else{ 
             system.debug(0);         
        }
    }
}