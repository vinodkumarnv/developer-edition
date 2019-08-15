public class AccountTriggerHandler 
{
    public static void CreateAccounts(List<Account> accList)
    {
        List<account> aLfinal = new List<account>();
        for(Account a: accList)
        {
            if(a.ShippingState != a.BillingState)
            {
                a.ShippingState = a.BillingState;
            }    
        }           
    }        
}