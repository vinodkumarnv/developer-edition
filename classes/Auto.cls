@isTest
public class Auto
{
    
     Private static testmethod void sag1()
    {
        Auto__c  a = new Auto__c ();
        a.Type__c ='New';
        a.Name = 'seven';
        insert a;
        
        Auto__c  aa = new Auto__c ();
        aa.Type__c ='New';
        aa.Name = 'seven';
        insert aa;
        
        Auto__c  aa1 = new Auto__c ();
        aa1.Type__c ='Existing';
        aa1.Name = 'seven';
        insert aa1;
        
        Auto__c  a1 = new Auto__c ();
        a1.Type__c ='Existing';
        a1.Name = 'seven';
        insert a1;
        
        Auto__c  a2 = new Auto__c ();
        a2.Type__c ='old';
        a2.Name = 'seven';
        insert a2;
        
        Auto__c  aa2 = new Auto__c ();
        aa2.Type__c ='old';
        aa2.Name = 'seven';
        insert aa2;
     }    
}