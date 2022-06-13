public class ContactSearch {
    
    public static List<Contact> searchForContacts(String LastName, String PostalCode){
        List<Contact> contactsFound = [SELECT Id,Name
                                       FROM Contact 
                                       WHERE LastName =:LastName 
                                       AND MailingPostalCode =:PostalCode];
        return contactsFound;
    }
}