trigger opp_crreate_my on Account (Before insert, After update) 
{
    list<opportunity> opp_mylist = new list<opportunity>();
    For(Account a:Trigger.New)
    {
        list<opportunity> opp_check = [select id from opportunity where accountid =:a.Id];
        System.debug('77777777777777777777'+opp_check);
        system.debug('777777seven777777'+opp_check.size());
        if((a.sla__c == 'Gold' || a.sla__c == 'Silver') && opp_check.size()==0)
        {              
            opportunity opp = new opportunity();
            opp.name = a.name+'-';
            opp.CloseDate = system.today()+ 45;
            opp.StageName = 'seven';
            opp.AccountId = a.Id;
            //insert opp;
            opp_mylist.add(opp);
        }
    }
    insert opp_mylist;
}