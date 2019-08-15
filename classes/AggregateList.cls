public without sharing class AggregateList 
{
    public AggregateResult[] results 
    {
        get {
            return [select AccountId aaa, count(Id) bbb from Contact group by AccountId];
        }
    }
}