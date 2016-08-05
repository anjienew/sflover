public class AddPrimaryContact implements Queueable{
    
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact con, String st){
        this.contact = con;
        this.state = st; 
    }
    
    public void execute(QueueableContext context){
        
        List<Contact> contacts = new List<Contact>();
                
        for(Account acct:[SELECT Id, BillingState, 
                          (Select Id, LastName From Contacts)
                          FROM Account
                          WHERE BillingState = :state]){
           Contact copycontact = contact.clone(false, false, false, false);
           copycontact.AccountId = acct.Id;
           contacts.add(copycontact);
                          }
       
        insert contacts;
    }

}