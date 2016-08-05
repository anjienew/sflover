trigger RestrictMerchandiseDeletion on Merchandise__c (before delete) {
    for(Merchandise__c merchandise:[SELECT Id
                            FROM Merchandise__c
                            WHERE Id IN :Trigger.old AND
                            ID IN (SELECT Merchandise__c FROM Line_Item__c)]){
          Trigger.oldMap.get(merchandise.Id).addError(
          'Cannot delete merchandise has transactions, original trigger.'); 
       }    

}