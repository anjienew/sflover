@isTest
public class TestDataFactory {
    public static invoice__c createOneInvoice(Boolean withLineItem){
        Invoice__c invoice = new Invoice__c();
        insert invoice;
        
        if(withLineItem){
            Merchandise__c m = createMerchandiseItem('Orange Juice', 10, 100);
            AddLineItem(invoice, m, 10);
            }
        return invoice;
    }
    private static Merchandise__c createMerchandiseItem(String pName, double pPrice, Integer pQuantity){
        Merchandise__c merchandise = new Merchandise__c (Name = pName,
                                                        Price__c = pPrice,
                                                        Quantity__c = pQuantity);
        insert merchandise;
        return merchandise;
    }
    private static void AddLineitem(Invoice__c inv, Merchandise__c m, Integer qty){
        Line_Item__c item = new Line_Item__c(
        					Name = '1',
        					Quantity__c = qty,
        					Invoice__c = inv.Id,
        					Merchandise__c = m.Id);
        insert item;
    }
    
}