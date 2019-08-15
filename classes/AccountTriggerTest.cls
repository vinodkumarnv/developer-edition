@isTest
public class AccountTriggerTest 
{
    @isTest
    public static void createAccounts()
    {
        List<Account> accs = new List<Account>();
        for(integer i=0; i<200; i++)
        {
            Account a = new Account();
            a.Name = 'Test'+i;
            a.BillingState = 'CA';
            a.ShippingState = 'US';
            accs.add(a);
        }   
       /* Account a1 = new Account();
            a1.Name = 'Test';
            a1.BillingState = 'CA';
            a1.ShippingState = 'US';
            accs.add(a1);*/
        
        insert accs;
    }    
}