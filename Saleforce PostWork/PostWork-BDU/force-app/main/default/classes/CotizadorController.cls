public class CotizadorController {
    
    private final sObject parent;
    public String code {get;set;}
    public List<PricebookEntry> listInv {get;set;}
    public List<QuoteLineItem> qli{set;}
    public Id QuoteId;
    public Name QuoteName;
    
    
    public CotizadorController(ApexPages.StandardController controller){
        parent = controller.getRecord();
    }
    
    public void search(){
        listInv = [SELECT Id, Pricebook2Id, Product2.Name, UnitPrice, Product2.ExternalId, Available__c, Reserved__c, Quantity__c 
                   FROM PricebookEntry WHERE ProductCode = :code];
        QuotationHelper search = new QuotationHelper();
        Double disp = 0;
        disp = search.searchProductByCode(code);
        
        for(PricebookEntry item : listInv){
            item.Available__c = disp;
        }
        
    }
    
    public void clear(){
        listInv.clear();
    }
    
    
    public void save(){
        try{
            PricebookEntry listInvt = [SELECT Id, Name, ProductCode, UnitPrice, Quantity__c
                                       FROM PricebookEntry 
                                       WHERE ProductCode = :code 
                                       LIMIT 1];
            
            QuoteId = ApexPages.currentPage().getParameters().get('Id');
            QuoteLineItem qli = new QuoteLineItem(Product2Id = listInvt.Id,
                                                  Quantity = listInvt.Quantity__c,
                                                  QuoteId = QuoteId,
                                                  UnitPrice = listInvt.UnitPrice,
                                                  PricebookEntryId = listInvt.id);
            insert qli;
        }catch(DMLException exc){
            exc.getMessage();
        }
        
        
        
        
        /*
QuoteLineItem qli = new QuoteLineItem();
qli = [SELECT Id, Quantity, QuoteId, Quote.Name FROM QuoteLineItem];
PricebookEntry listInvt = new PricebookEntry();
listInvt = [SELECT Id, Available__c,Reserved__c, Quantity__c FROM PricebookEntry];

IF(qli.Quantity <= listInvt.Available__c){
qli.Quantity = qli.Quantity + Quant;

}
update qli;*/
    }
}