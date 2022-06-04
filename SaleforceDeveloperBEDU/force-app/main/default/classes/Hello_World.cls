public class Hello_World {
    
    public void consultasSOQL(){
        Account acc = [SELECT id, Name FROM Account WHERE Name = 'Burlington Textiles Corp of America' LIMIT 1];
        System.debug('El nombre de la cuenta es: '+acc.Name);    
    }
    
    public void hello(){
        system.debug('Hola mundo');
    }
    
    public void HelloSOSL(){
        
      List<List<sObject>> result = [FIND 'United'
      IN ALL FIELDS
      RETURNING
              Account(Id, Name, Type
              WHERE Rating = 'Hot'
              ORDER BY CreatedDate DESC),
              Lead(Id, Name, Company
              ORDER BY CreatedDate),
              Contact(Id, Name, Account.Name
              ORDER BY Account.Name, LastName),
              Opportunity(Id, Name, Account.Name
                          ORDER BY CreatedDate)];
        
    }
    
     
}