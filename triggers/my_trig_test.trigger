trigger my_trig_test on Contact (After insert,After Update) 
{
    For(contact c:trigger.new)
    {
        System.debug(c.lastName+'777 new 7777');
    }
    //if(Trigger.isupdate)
   // {
        for(contact c:Trigger.old)
        {
            system.debug(c.lastname+'@@@@@ old @@@@@@');
        }
   // }
}
/*
 * types of sb
 * 1.Developer
 * 2.Developer pro
 * 3.partial
 * 4.full copy sandbox.
*/