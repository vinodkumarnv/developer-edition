@isTest
public class AccountManagerTest 
{
    @isTest static void testAccountById()
    {
        id recordId = createTestRecord();
        
        RestRequest request = new RestRequest();
        request.requestUri = 'https://ap6.salesforce.com/services/apexrest/Accounts/'+recordId+'/contacts';
            
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test', thisAccount.name);
    }    
    static Id createTestRecord() 
    {
        // Create test record
        Account acc = new Account(Name='Test');
        insert acc;
        Contact c = new Contact(lastName = 'Test',AccountId = acc.id);
        insert c;
        return acc.Id;
    }
}