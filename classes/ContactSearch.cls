public class ContactSearch {
    public ContactSearch() {

    }
    public static List<contact> searchForContacts(String lastName, String MailingPostalCode)
    {
        List<Contact> c = [Select id,name from Contact where lastName =: lastName AND MailingPostalCode =:MailingPostalCode];
        return c;
    }
}