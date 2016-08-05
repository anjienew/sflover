public class MerchandiseOperations {
    public static Id invoice(String pName, Integer pSold){
        Merchandise__c m = [SELECT Name FROM Merchandise__c
                           WHERE Name=:pName LIMIT 1];
        System.assertNotEquals(null, m);
        
        Invoice__c i = new Invoice__c();
        insert i;
        
        Line_Item__c li = new Line_Item__c(
        						Name = '1',
        						Quantity__c = pSold,
        						Invoice__c = i.Id,
        						Merchandise__c = m.Id);
        insert li;
        return i.Id;
    }

}