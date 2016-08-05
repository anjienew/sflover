global class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> accountIds){
        List<Account> accounts = new List<Account>();
                
        for(Account acct:[SELECT Id,  Number_of_Contacts__c, 
                          (Select Id From Contacts)
                          FROM Account WHERE Id IN :accountIds])
        {
            acct.Number_of_Contacts__c = acct.Contacts.size();
            accounts.add(acct);
        }
        
        update accounts;
        //fgfgfgffgf
    }

}