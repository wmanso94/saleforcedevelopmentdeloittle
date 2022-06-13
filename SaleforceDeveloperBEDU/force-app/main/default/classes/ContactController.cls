public with sharing class ContactController {
    @AuraEnabled(cacheable=True)
    public static List<Contact> getContactList(){

        return[
            SELECT id, Name, Title, Phone, Email
            FROM Contact
            WITH Security_enforced
            Limit 10
            ];
    }
}