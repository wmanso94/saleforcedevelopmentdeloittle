public inherited sharing class LWCExamples {

    @AuraEnabled(Cacheable = true)
    public static list<PricebookEntry> retriveAccs(String strAccName) {
        strAccName = '%' + strAccName + '%';
        list<PricebookEntry> lstAccs = [SELECT Id, Product_Name__c, ExternalID__c, UnitPrice, Available__c, Reserved__c, Quantity__c
                                        FROM PricebookEntry  WHERE ProductCode LIKE :strAccName
                                        LIMIT 1];

        if(lstAccs.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        return lstAccs;
    }
}