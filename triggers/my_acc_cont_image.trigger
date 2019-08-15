trigger my_acc_cont_image on Contact (before insert,before Update) 
{
	set<Id> accid = new set<id>();
    //set<contact> img = new set<contact>(); 
    map<id,string>Imag_map = new map<id,string>();
    //to fetch id
    For(Contact c:Trigger.New)
    {
        accid.add(c.accountid);
    }
    
    //to save the content in map variable
    For(Account a:[select id,Image__c from account where id=:accid])
    {   
     	imag_map.put(a.id,a.Image__C);
    	system.debug('seven7777777777777'+imag_map);
    } 
    //to update image or content in contact new record.
    For(contact cnew:Trigger.New)
    {
        cnew.image__c=Imag_map.get(cnew.accountid);
    }
    
}