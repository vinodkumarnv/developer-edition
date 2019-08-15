public class AccountUtils 
{
	public static List<account> accountsByState(String state)
    {
        List<Account> acl = [Select id,name from Account where BillingState =: state];
        return acl;
    }    
}