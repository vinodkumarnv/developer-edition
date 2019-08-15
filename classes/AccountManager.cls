@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager 
{
    @HttpGet
    global static Account getAccount()
    {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accParam = request.requestURI.remove(request.requestURI.substring(request.requestURI.lastIndexOf('/')));        
        Id param = accParam.substring(accParam.lastIndexOf('/')+1);
                
        Account a = [Select id,name,(select id,name from contacts) from account where id=:param];
        return a;
    }

}