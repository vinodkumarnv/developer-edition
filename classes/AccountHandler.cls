public class AccountHandler 
{
    public AccountHandler() 
    {}
    public static Account insertNewAccount(String name) 
    {
        Account ac = new Account(name=name);
        try 
        {            
            insert ac;
        } 
        catch (Exception e)
        {
           System.debug(e.getMessage());
        }
        if(ac.id != null)
        return ac;
        return null;
    }
}