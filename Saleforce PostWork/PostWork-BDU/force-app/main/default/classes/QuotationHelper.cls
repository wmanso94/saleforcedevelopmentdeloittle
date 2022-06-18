public class QuotationHelper implements QuotationSync {
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
        return [SELECT id, Name, CodigoProd__c, Cantidad_dis__c,Cantidad_apart__c, ExternalID__c FROM Inventario__c LIMIT 200];
    }
    
    public boolean confirmProductExistByCode(String code){
        boolean ifexist = false; 
        
        List<Inventario__c> invt = [SELECT Id 
                                    FROM Inventario__c 
                                    WHERE CodigoProd__c = :code];
        if(invt.size() > 0){
            ifexist = true;
        }
        return ifexist;
    }
    
    public Double searchProductByCode(String code){
        
        Double CantDis = 0;
        
        Inventario__c CantDisInv = [SELECT Id, Cantidad_dis__c 
                                    FROM Inventario__c 
                                    WHERE CodigoProd__c = :code];
        CantDis = CantDisInv.Cantidad_dis__c;
        
        if(CantDis == 0 || CantDis == null){
            return 0;
        }else{
            return CantDis;
        }
    }
    
    
    public void availableReservedQuantity(Id Product2Id, double Quantity){
        
        Product2 Prodct = [SELECT Id, Name, ExternalId
                           FROM Product2
                           WHERE Id = :Product2Id LIMIT 1];
        
        boolean ifexist = confirmProductExistByCode(Prodct.ExternalId);
        
        if(ifexist){
            double Disbl = searchProductByCode(Prodct.ExternalId);
            if(Disbl > Quantity){
                Inventario__c CantInv = [SELECT Id, Name, Cantidad_dis__c 
                                         FROM Inventario__c];
                CantInv.Cantidad_apart__c = CantInv.Cantidad_apart__c + Quantity;
                CantInv.Cantidad_dis__c = CantInv.Cantidad_dis__c - Quantity;
                update CantInv;
            }
        }
        
    }
    
    @InvocableMethod(label='StockAlert')
    public static void StockEmptyAlert(){
        QuotationHelper qth = new QuotationHelper();
        
        List<Inventario__c> listInvt = new List<Inventario__c>();
        
        listInvt = qth.productsInInventory();
        List<FeedItem> items = new List<FeedItem>();
        
        for(Inventario__c inv:listInvt){
            if(inv.Cantidad_dis__c == 0){
                FeedItem objPost = new Feeditem();
                objPost.ParentId = UserInfo.getUserId();
                objPost.Body = 'No hay stock en el inventario del Producto';
                items.add(objPost);
            }
        }
        insert items;
    }
}