public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer contactNum, String lastName){
        
        List<Contact> conList = new List<Contact>();
        
        for(Integer i=0;i<contactNum;i++){
            conList.add(new Contact(LastName = lastName,
                                   FirstName = 'Test '+i));
            }
        return conList;
    }
    
}