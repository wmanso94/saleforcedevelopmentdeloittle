public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads (String searchText){
        List<List<sObject>> searchList = [FIND :searchText IN ALL FIELDS
                                         RETURNING 
                                         Contact(FirstName,LastName),
                                         Lead(FirstName,LastName)];
        
        Contact[] searchContacts = (Contact[])searchList[0];
        Lead[] searchLeads = (Lead[])searchList[1];
        
        system.debug('Found the following contacts.');
        for(Contact c : searchContacts){
            system.debug(c.LastName + ', ' + c.FirstName);
        }
        
        system.debug('Found the following leads.');
        for(Lead l : searchLeads){
            system.debug(l.LastName + ', ' + l.FirstName);
        }
        return searchList;
    }

}