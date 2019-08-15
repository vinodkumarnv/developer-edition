public with sharing class myController1 
{
    private final Account account1;
    public myController1() 
    {
        account1 = [select id, name, site, NumberOfEmployees, Industry from Account where id = :ApexPages.currentPage().getParameters().get('id')];
    }
    /*public Account getAccount() 
    {
        return account1;
    }*/
    public PageReference save() 
    {
        update account1;
        return null;
    }
    public PageReference cancel() 
    {
        return null;
    }
}