@isTest
private class DailyLeadProcessorTest {
    
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    @isTest
    private static void Test(){
        
        List<Lead> leads = new List<Lead>();
        for(Integer i=0;i<200;i++){
            Lead ld = new Lead(LastName = 'TestLastName' + i,
                               Company = 'TestCompany' + i);
            leads.add(ld);
        }
        insert leads;
        
        Test.startTest();
        System.schedule('Update LeadSource on 200 Leads', CRON_EXP, new DailyLeadProcessor());
        
        Integer beforeresult = [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(beforeresult, 0);
        Test.stopTest();
        
        Integer afterresult = [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(afterresult, 200);
        
    }

}