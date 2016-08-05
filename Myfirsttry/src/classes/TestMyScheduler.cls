@isTest
private class TestMyScheduler {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    @isTest
    static void test(){
        
        List<Merchandise__c> ml = new List<Merchandise__c>();
        for (Integer i=0;i<200;i++){
            Merchandise__c m = New Merchandise__c(
            				Name = 'Merchandise '+ i,
            				Price__c = 20,
            				Quantity__c = 10);
            ml.add(m);
        }
        insert ml;
        
        Test.startTest();
        String jobId = System.schedule('ScheduleApexClassTest', CRON_EXP, new MyScheduler());
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                         FROM CronTrigger
                         WHERE id = :jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2022-03-15 00:00:00', String.valueOf(ct.NextFireTime));
        
        Merchandise__c[] tml = [SELECT Id FROM Merchandise__c
            			       WHERE Id 
                               NOT IN (SELECT Merchandise__c FROM Line_Item__c)];
        System.assertEquals(200, tml.size());
        Test.stopTest();
        
        tml = [SELECT Id FROM Merchandise__c
               WHERE Id 
               NOT IN (SELECT Merchandise__c FROM Line_Item__c)];
        System.assertEquals(200, tml.size());
    }
}