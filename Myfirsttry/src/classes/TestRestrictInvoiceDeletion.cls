@isTest
private class TestRestrictInvoiceDeletion {
    @isTest
    static void TestDeleteInvoiceWithLineItem(){
        Invoice__c invoice = TestDataFactory.createOneInvoice(true);
       	Database.DeleteResult result = Database.delete(invoice.Id, false);
        System.assert(!result.isSuccess());        
    }
     @isTest
    static void TestDeleteInvoiceWithoutLineItem(){
        Invoice__c invoice = TestDataFactory.createOneInvoice(false);
       	Database.DeleteResult result = Database.delete(invoice.Id, false);
        System.assert(result.isSuccess());        
    }
     @isTest
    static void TestBulkDeleteInvoices(){
        List<Invoice__c> invList = new List<Invoice__c>();
        invList.add(TestDataFactory.createOneInvoice(true));
        invList.add(TestDataFactory.createOneInvoice(false));
        Database.DeleteResult[] results = Database.delete(invList, false);
        System.assert(!results[0].isSuccess());
        System.assert(results[1].isSuccess());                
    }

}