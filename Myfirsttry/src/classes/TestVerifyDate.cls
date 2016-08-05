@isTest
private class TestVerifyDate {
    @isTest static void testWithin30(){
        Date D1 = VerifyDate.CheckDates(Date.newInstance(2013,3,1), Date.newInstance(2013,3,2));
        System.assertEquals(Date.newInstance(2013,3,2), D1);
    }
        
    @isTest static void testNotWithin30(){
        Date D1 = VerifyDate.CheckDates(Date.newInstance(2013,3,1), Date.newInstance(2013,4,20));
        System.assertEquals(Date.newInstance(2013,3,31), D1);
    }
}