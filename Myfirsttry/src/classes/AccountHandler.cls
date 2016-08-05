public class AccountHandler {
    public static Account insertNewAccount(String str){
        try{
            Account acct = new Account(Name=str);
            insert acct;
            return acct;
        }catch(DmlException e){
            System.debug('A DML exception has occurred: ' +e.getMessage());
            return null;
        }
    }

}