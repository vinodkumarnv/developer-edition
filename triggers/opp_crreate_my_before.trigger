trigger opp_crreate_my_before on Account (before insert) 
{
    For(Account a:Trigger.New)
    {
        if(a.sla__c == 'Gold' || a.sla__c == 'Silver')
            {
                opportunity opp = new opportunity();
                opp.name = a.name+'-';
                opp.CloseDate = system.today()+ 45;
                opp.StageName = 'seven';
                opp.AccountId = a.Id;
                insert opp;
            }
    }
    

}