public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        
        List<Account> accountsToUpdate = new List<Account>();
        
        List<Account> accounts = [SELECT Id, Name, 
                                 (SELECT Id FROM Contacts) 
                                  FROM Account 
                                  WHERE Id IN :accountIds];
        //process account records
        for(Account acc :accounts){
            List<Contact> contactList = acc.Contacts;
            acc.Number_of_Contacts__c = contactList.size();
            accountsToUpdate.add(acc);
        }
         update accountsToUpdate;   
     }

}