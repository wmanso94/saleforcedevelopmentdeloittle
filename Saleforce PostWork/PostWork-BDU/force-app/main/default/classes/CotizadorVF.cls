public class CotizadorController {

    private final sObject parent;
    public String code {get;set;}
    public List<PricebookEntry> listInv {get;set;}

    public CotizadorController(ApexPages.StandardController controller){
        parent = controller.getRecord();
    }

    public void search(){
        listInv = [SELECT Id, Pricebook2Id, Product2.Name, UnitPrice, Product2.ExternalId, Available__c, Quantity__c
                   FROM PricebookEntry];
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

}