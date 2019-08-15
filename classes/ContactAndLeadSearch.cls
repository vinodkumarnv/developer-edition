public class ContactAndLeadSearch {
    public ContactAndLeadSearch() {

    }
    public static List<List<sObject>> searchContactsAndLeads(String name)
    {       
        
        List<List<sObject>> searchList = [FIND :name IN ALL FIELDS 
                   RETURNING Lead(Name),Contact(FirstName,LastName,Department)];
        
        return searchList;
    }
}