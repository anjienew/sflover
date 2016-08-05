public class ContactSearch {
    public static List<Contact> searchForContacts(String str1, String str2){
        Contact createContact = new Contact (LastName=str1,
                                            FirstName='Jie',
                                            MailingPostalCode=str2);
        System.debug(createContact);
        
        Contact[] matchContact = [SELECT Id, Name
                                  FROM Contact
                                  WHERE LastName = :str1 AND MailingPostalCode = :str2];
        System.debug(matchContact[0]);
        return matchContact;
        
    }

}