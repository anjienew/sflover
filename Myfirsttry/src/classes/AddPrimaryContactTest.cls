@isTest
private class AddPrimaryContactTest {
    
    @isTest
    private static void Test(){
        List<Account> accountsNY = new List<Account>();
    	List<Account> accountsCA = new List<Account>();
    
    	for(Integer i=0;i<50;i++){
        	Account acctNY = new Account(Name = 'acctNY' + i,
            	                    BillingState = 'NY');
        	accountsNY.add(acctNY);
    	}
    	insert accountsNY;
        
        for(Integer i=0;i<50;i++){
        	Account acctCA = new Account(Name = 'acctCA' + i,
            	                    BillingState = 'CA');
        	accountsCA.add(acctCA);
    	}
    	insert accountsCA;
        
        Contact contact = new Contact(LastName = 'CAContact');
        insert contact;
        
        Test.startTest();
        System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        Test.stopTest();
        
        Integer result=0;
        for(Account acct:[SELECT Id, BillingState, 
                          (Select Id, LastName From Contacts)
                          FROM Account
                          WHERE BillingState = 'CA']){
            result = result + acct.Contacts.size();
                          }
        
        System.assertEquals(result, 50);
		
    }
}