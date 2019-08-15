trigger rollupTrigger on Quote (before insert, before update, after delete)
{
    Set<Id> orgIds = new Set<Id>();
    List< opportunity> updates = new List<opportunity>();
    Quote[] emp = null;
    if(Trigger.isInsert||Trigger.isUpdate)
    {
        emp = Trigger.new;
    }
    else if(Trigger.isDelete)
    {
        emp = Trigger.old;
    }
    /*for (Quote e : emp) 
    {
        if(e.opportunity != null)
        orgIds.add(e.opportunity);
    }*/
    
    for (Quote e : emp) 
    {
        orgIds.add((ID)e.get('opportunity'));
    }
    
    
    
    for (AggregateResult ar : [select opportunityId i, sum(TotalPrice) su, 
    min(TotalPrice) mi, max(Calculated_Discount__c) ma,count(id) ids from Quote 
    where opportunityId in :orgIds group by opportunityid])
    {
        updates.add(new opportunity(Id = (Id)ar.get('i'),
        amount = (Decimal)ar.get('su'),
        Highest_Discount__c = (Decimal)ar.get('ma'),TrackingNumber__c = (string)ar.get('ids')));
    }//ExpectedRevenue = (Decimal)ar.get('mi'),
    update updates;
}