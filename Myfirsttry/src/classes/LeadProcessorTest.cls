@isTest
private class LeadProcessorTest {
    @isTest
    private static void test(){
        String query = 'SELECT Id FROM Lead';
        
        List<Lead> leads = new List<Lead>();
        for(Integer i=0;i<200;i++){
            leads.add(new Lead(LastName = 'LastName' + i,
                               Company = 'Company' + i));
        }
        insert leads;
        
        Test.startTest();
        Database.executeBatch(new LeadProcessor(query));
        Test.stopTest();
        
        Integer result = 0;
        for(Lead ld:[SELECT Id, LeadSource FROM Lead]){
            if(ld.LeadSource == 'Dreamforce')
                result++;
        }
        
        System.assertEquals(result, 200);
    }

}