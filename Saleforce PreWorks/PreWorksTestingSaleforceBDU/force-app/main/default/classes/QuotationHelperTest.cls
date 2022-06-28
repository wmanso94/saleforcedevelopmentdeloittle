@IsTest
public class QuotationHelperTest {
    
    @IsTest
    public static void productsInInventorytest(){
        Inventario__c invt3 = new Inventario__c();
        invt3.Name = 'Inventario Prueba 04';
        invt3.CodigoProd__c = 'InPr04';
        invt3.Cantidad_dis__c = 100;
        invt3.Cantidad_apart__c = 50;
        insert invt3;
        
        Test.startTest();
        QuotationHelper qth = new QuotationHelper();
        qth.productsInInventory();
        Test.stopTest();
    }
    
    @IsTest
    public static void confirmProductExistByCodetest(){
        Inventario__c invt = new Inventario__c();
        invt.Name = 'Inventario Prueba 01';
        invt.CodigoProd__c = 'InPr01';
        invt.Cantidad_dis__c = 100;
        invt.Cantidad_apart__c = 50;
        insert invt;
        
        Test.startTest();
        QuotationHelper qth = new QuotationHelper();
        boolean results = qth.confirmProductExistByCode('InPr01');
        
        Test.stopTest();   
        system.assertEquals(true, results);
    }
    
    @IsTest
    public static void searchProductByCodetest(){
        Inventario__c invt = new Inventario__c();
        invt.Name = 'Inventario Prueba 02';
        invt.CodigoProd__c = 'InPr02';
        invt.Cantidad_dis__c = 150;
        invt.Cantidad_apart__c = 100;
        insert invt;
        Inventario__c invt2 = new Inventario__c();
        invt2.Name = 'Inventario Prueba 03';
        invt2.CodigoProd__c = 'InPr03';
        invt2.Cantidad_dis__c = 0;
        invt2.Cantidad_apart__c = 0;
        insert invt2;
        
        Test.startTest();
        QuotationHelper qth = new QuotationHelper();
        double result = qth.searchProductByCode('InPr02');
        double result2 = qth.searchProductByCode('InPr03');
        
        Test.stopTest();
        system.assertEquals(150, result);
        system.assertEquals(0, result2);
    }
    
    @IsTest
    public static void availableReservedQuantitytest(){

        Product2 prod = new Product2(Name = 'Laptop X200', Family = 'Hardware',ProductCode = 'PrTest01', ExternalId = 'PrTest01');
        insert prod;
        
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(Pricebook2Id = pricebookId, Product2Id = prod.Id, UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        
        PricebookEntry customPrice = new PricebookEntry(Pricebook2Id = customPB.Id, Product2Id = prod.Id, UnitPrice = 12000, IsActive = true);
        insert customPrice;
        
        Account acc = new Account(Name='TestAccount');
        insert acc;
        
        Opportunity opp = new Opportunity(Name='TestOpportunity', AccountId=acc.Id, CloseDate=Date.Today(), StageName='Suspect', Pricebook2Id=customPB.Id);
        insert opp;
        
        Quote qta = new Quote(Name = 'New Test Quote', opportunityid = opp.Id);
        insert qta;
        
        QuoteLineItem qli = new QuoteLineItem(Product2Id=prod.id, Quantity = 100,UnitPrice=12,QuoteId=qta.id, PricebookEntryId = customPrice.Id);
        insert qli;
        
        Inventario__c invt = new Inventario__c(Name = 'Inventario Prueba 02', CodigoProd__c = 'PrTest01', ExternalId__c = 'PrTest01', Cantidad_dis__c = 150, Cantidad_apart__c = 1);
        insert invt;
        
        Test.startTest();
        QuotationHelper qth = new QuotationHelper();
        qth.availableReservedQuantity('PrTest01', 1);
        
        Test.stopTest();
        
    }
    
    @IsTest
    public static void StockEmptyAlerttest(){
        
        Test.startTest();
        
        Test.stopTest();
    }
}