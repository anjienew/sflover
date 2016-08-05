public class MerchandiseUtility {
    public static void mainProcessing(){
        try{insertMerchandise();}
        catch(MerchandiseException me){
            System.debug('Message: ' + me.getMessage());
            System.debug('Cause: ' + me.getCause());
            System.debug('Line Number: ' + me.getLineNumber());
            System.debug('Stack Trace: '+ me.getStackTraceString());
        }
    }
    
    public static void insertMerchandise(){
        try{
            Merchandise__c m = new Merchandise__c();
            insert m;
        }catch(DmlException e){
            throw new MerchandiseException('Merchandise item could not be insert.',e);
        }
    }

}