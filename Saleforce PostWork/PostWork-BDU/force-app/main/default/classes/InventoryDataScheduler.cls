public class InventoryDataScheduler implements Schedulable{
    
    public void execute(SchedulableContext shct){
        ExternalLegacyConnection();
    }
    
    @future(callout=true)
    public static void ExternalLegacyConnection() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://64bjp0q5wg.execute-api.us-east-2.amazonaws.com/Implement/');
        request.setMethod('Get');
        HttpResponse response = http.send(request);
        
        IF(response.getStatusCode() == 200){
            map<String, Object> results = (map<String, Object>) json.deserializeUntyped(response.getBody());
            map<String, Object> results2 = (map<String, Object>) results.get('body');
            List<Object> listProd = (List<Object>) results2.get('Inventario');
            
            List<map<String, Object>> data = new List<map<String, Object>>();
            
            for(Object item : listProd){
                data.add((map<String, Object>)item);
            }
            
            List<Inventario__c> lstRestInv = new List<Inventario__c>();
            
            
            for(map<String, Object> key : data){
                Inventario__c inv = new Inventario__c();
                Integer pos = 0;
                
                for(Object item : key.values()){
                    IF(pos == 0){
                        inv.Name = '' + item;
                    }else IF(pos == 1){
                        inv.CodigoProd__c = '' + item;
                    }else IF(pos == 2){
                        inv.Cantidad_dis__c = (Double) item;
                    }else IF(pos == 3){
                        inv.Cantidad_apart__c = (Double) item;
                        pos = 0;
                        lstRestInv.add(inv);
                    }
                    pos++;
                }
            }
            
            system.debug('Products reads from REST:' +lstRestInv);
            
            QuotationHelper qt = new QuotationHelper();
            List<Inventario__c> listInvt = qt.productsInInventory();
            
            for(Inventario__c inv : lstRestInv){
                for(Inventario__c str : listInvt){
                    IF(inv.CodigoProd__c == str.CodigoProd__c){
                        inv.Id = str.Id;
                    }
                }
            }
            
            update lstRestInv;
                
        }
        
    }

}