@isTest
private class AccountProcessorTest {
    
    @isTest
    private static void test(){
        List<Account> accounts = new List<Account>();
        for(Integer i=0;i<20;i++)
            accounts.add(new Account(Name = 'Acct'+i));
        
        Insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0;i<20;i++)
            contacts.add(new Contact(LastName = 'Last' + i,
                                     AccountId = accounts[i].Id));
        Insert contacts;
        
        List<Id> accountIds = new List<Id>(new Map<Id, Account>(accounts).keySet());
        System.assertEquals(accounts.size(), 20);
        System.assertEquals(accountIds.size(), 20);
        
        Integer count = [SELECT COUNT() FROM Contact];
        System.assertEquals(count, 20);
        
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        Integer result = 0;
        for(Account acct:[SELECT Id,  Number_of_Contacts__c, 
                          (Select Id From Contacts)
                          FROM Account WHERE Id IN :accountIds])
        {
            if(acct.Number_of_Contacts__c == acct.Contacts.size())
                result++;
        }

        System.assertEquals(result, 20);
    } 

}