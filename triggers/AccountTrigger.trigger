trigger AccountTrigger on Account (before insert) 
{
	List<Account> alist = new List<Account>();
    if(Trigger.isBefore && Trigger.isInsert)
    AccountTriggerHandler.CreateAccounts(Trigger.new);
    
}