trigger aaaa on Time_entry__c (After Insert, After Update, After Delete) 
{
    If(Trigger.IsInsert || Trigger.IsUpdate)
    {
        For(Time_entry__c te:Trigger.new)
        {
            Map<String, Object> params = new Map<String, Object>();
            params.put('varProjectId', te.Project__c);

            Flow.Interview.Rollup_demo helloWorldFlow = new Flow.Interview.Rollup_demo(params);
            helloWorldFlow.start();
        }
    }
    If(Trigger.IsDelete)
    {
        For(Time_entry__c te:Trigger.old)
        {
            Map<String, Object> params = new Map<String, Object>();
            params.put('varProjectId', te.Project__c);
            System.debug('AAAAAAAAAAAAAAAAAAa'+params);
            
            Flow.Interview.Rollup_demo helloWorldFlow = new Flow.Interview.Rollup_demo(params);
            //System.debug('TTTTTTTTTTTTTTTTTTT'+helloWorldFlow.varTotalTime);
            helloWorldFlow.start();
            System.debug('SSSSSSSSSSSSSS'+helloWorldFlow.varProjectId);
            //System.debug('hhhhhhhhhhhhhhhhhh'+helloWorldFlow.varTotalTime);
        }
    }
}