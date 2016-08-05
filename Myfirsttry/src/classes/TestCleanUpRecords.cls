@isTest
private class TestCleanUpRecords {
    @isTest
    static void test(){
        String query = 'SELECT Id, CreatedDate FROM Merchandise__c' +
            			' WHERE Id NOT IN (SELECT Merchandise__c FROM Line_Item__c)';
        
        List<Merchandise__c> ml = new List<Merchandise__c>();
        for (Integer i=0;i<10;i++){
            Merchandise__c m = New Merchandise__c(
            				Name = 'Merchandise '+ i,
            				Price__c = 20,
            				Quantity__c = 10);
            ml.add(m);
        }
        
        insert ml;
        
        Test.startTest();
        CleanUpRecords c = new CleanUpRecords(query);
        Database.executeBatch(c);
        Test.stopTest();
        
        Integer i = [SELECT COUNT() FROM Merchandise__c];
        System.assertEquals(0, i);
    }

}