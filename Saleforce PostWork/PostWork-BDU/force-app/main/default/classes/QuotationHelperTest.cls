@IsTest
public class QuotationHelperTest {
    
    @IsTest
    public static void initialConfigtest(){
        Test.startTest();
        QuotationHelper qth = new QuotationHelper();
        qth.initialConfig();
        Test.stopTest();
    }

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
        Quote qot = new Quote();
        
        PricebookEntry pbe = new PricebookEntry();

        Product2 prod = new Product2();
        prod.Name = 'Product Test 01';
        prod.ProductCode = 'PrTs01';
        prod.ExternalId = 'PrTs01';
        insert prod;
 
        QuoteLineItem qli = new QuoteLineItem();
        qli.ExternalId__c = 'PrTs01';
        qli.Quantity = 20;
        qli.PricebookEntryId = '01uIY0000017McaYAE';
        qli.Product2Id = prod.Id;
        qli.QuoteId = '0Q0IY00000008RP0AY';
        qli.UnitPrice = 125;
        insert qli;
        
        Inventario__c inv = new Inventario__c();
        inv.Name = 'Inventario test 01';
        inv.CodigoProd__c = 'PrTs01';
        inv.ExternalID__c = 'PrTs01';
        inv.Cantidad_dis__c = 100;
        inv.Cantidad_apart__c = 50;
        insert inv;

        Test.startTest();
        QuotationHelper qth = new QuotationHelper();
        qth.availableReservedQuantity('01tIY000000jZEDBA2', 20);
        
        Test.stopTest();
        
    }
    
}