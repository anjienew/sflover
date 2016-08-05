trigger RestrictInvoiceDeletion on Invoice__c (before delete) {
   /* List<Invoice__c> invoices = [SELECT Id, Name, (SELECT Name FROM Line_Items__r)
                                FROM Invoice__c
                                WHERE Id IN :Trigger.old];
    
    for(Invoice__c invoice:invoices){
        if(!invoice.Line_Items__r.isEmpty())
            Trigger.oldMap.get(invoice.Id).addError
            ('Cannot delete invoice statement with line items, modified trigger');
    }*/
    
    for(Invoice__c invoice:[SELECT Id
                            FROM Invoice__c
                            WHERE Id IN :Trigger.old AND
                            ID IN (SELECT Invoice__c FROM Line_Item__c)]){
          Trigger.oldMap.get(invoice.Id).addError(
          'Cannot delete invoice with line items, original trigger.'); 
       }    
}