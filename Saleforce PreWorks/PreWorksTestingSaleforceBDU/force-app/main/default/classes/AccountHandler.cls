public class AccountHandler  {
    public static Account insertNewAccount(String accountName){
        try{
            Account newAccount = new Account(Name=accountName);
            insert newAccount;
            return newAccount;
        }catch (DMLException e){
            system.debug('A DML exception has occurred: ' +
                        e.getMessage());
            return null;
        }
    }

}