public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String str){
        Contact testContact = new Contact(LastName = 'Smith');
        Lead testLead = new Lead(LastName = 'Smith',
                                Company = 'abc');
        insert testContact;
        insert testLead;
        List<List<SObject>> searchList = [FIND :str IN NAME FIELDS
                                         RETURNING Contact(LastName, FirstName), Lead(LastName, FirstName)];
        return searchList;
    }

}