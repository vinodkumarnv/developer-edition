trigger OrderEventTrigger on Order_Event__e (after insert) 
{
    User myUser = [SELECT Id FROM User WHERE Name='Vinod Kumar' LIMIT 1];

    List<task> taskList = new List<task>();

    for(Order_Event__e event: trigger.new)
    {
        if(event.Has_Shipped__c == true)
        {
            task t = new task();
            t.Priority = 'Medium';
            t.Subject =  'Follow up on shipped order ' + event.Order_Number__c;
            t.OwnerId = myUser.Id;
            taskList.add(t);
        }
    }
    insert taskList;
}