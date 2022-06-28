public with sharing class QuotationHandler {
    @AuraEnabled(cacheable=true)
    public static List<PricebookEntry> getPricebookEntry(string searchKey) {
        return [SELECT Id, ExternalID__c, UnitPrice, Available__c, Reserved__c, Quantity__c
                FROM PricebookEntry WHERE ProductCode = :searchKey
                LIMIT 1];
    }
    @AuraEnabled(cacheable=true)
    public static List<Product2> getProducts(string searchKey) {
        return [SELECT Id, Name,ExternalId
                FROM Product2 WHERE ProductCode = :searchKey
                LIMIT 1];
    }/*
    @AuraEnabled(cacheable=true)
    public static List<Product2> getQuoteLineItem(string searchKey) {
        return [SELECT Id, ExternalId__c, Quantity, ListPrice, UnitPrice, TotalPrice
                FROM QuoteLineItem WHERE ExternalId__c = :searchKey
                LIMIT 200];
    }

    @AuraEnabled(cacheable=true)
    public static void saveQuoteLineItem(QuoteLineItem item) {
        try {
            insert item;
        }
        catch(Exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }*/
}