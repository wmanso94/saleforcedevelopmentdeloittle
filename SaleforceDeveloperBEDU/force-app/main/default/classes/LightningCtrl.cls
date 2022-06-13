public class LightningCtrl {
    @AuraEnabled
    public static List<Contact> getContacts(){
        return [SELECT Name, Phone, Email FROM COntact limit 5];
    }

}