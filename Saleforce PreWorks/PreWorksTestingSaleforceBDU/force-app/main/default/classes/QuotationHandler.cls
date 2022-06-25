public with sharing class QuotationHandler {
    @AuraEnabled(cacheable=true)
    public static List<PricebookEntry> getPricebookEntry(string searchKey) {
        return [SELECT Id, Pricebook2Id, Product2.Name, UnitPrice, Product2.ExternalId, Available__c, Reserved__c, Quantity__c
                FROM PricebookEntry WHERE ProductCode = :searchKey
                LIMIT 1];
    }
}
