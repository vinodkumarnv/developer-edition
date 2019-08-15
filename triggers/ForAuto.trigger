trigger ForAuto on Auto__c (Before insert,Before update) 
{
   //for "New" Type.
    //a to hold the Array of new values, that should be updated.
    //list<Auto__C> a = new list<Auto__c>();
    //to get the count of Existing Records.
    Integer Newcount = 0;
    Integer Existingcount = 0;
    Integer oldcount = 0;  
  
   //to get the number, which is newly created.
  
    //Auto__c TNumber = [Select Number__c from Auto__c where Type__C=:'New' order by CreatedDate desc limit 1];
   
    
    System.debug('Hi I am Trigger');
  
    for( Auto__c ta: Trigger.new)
    {
        
        if(ta.Type__c == 'New')
        {
            
            Newcount = [Select count() from Auto__c where Type__c=:'New'];
            if(Newcount == 0)
            {
                ta.Number__c = 1;     
            }
            else
            {    
                    For(Auto__C oldauto: [Select Number__c from Auto__c where Type__C=:'New' order by CreatedDate desc limit 1])
                    {
                        System.debug('#########'+oldauto.Number__c);
                        ta.Number__c = oldauto.Number__c + 1;
                    }
            }             
        }
        else if(ta.Type__c == 'Existing')
        {    
            Existingcount = [Select count() from Auto__c where Type__c=:'Existing'];
            if(Existingcount == 0)
            {
                ta.Number__c = 1;      
            }
            else
            {    
                    For(Auto__C oldauto: [Select Number__c from Auto__c where Type__C=:'Existing' order by CreatedDate desc limit 1])
                    {
                        ta.Number__c = oldauto.Number__c + 1;
                    }
            }      
        }
        else if(ta.Type__c == 'old')
        {
            
            oldcount = [Select count() from Auto__c where Type__c=:'old'];
            if(oldcount == 0)
            {
                ta.Number__c = 1; 
            }
            else
            {    
                    For(Auto__C oldauto: [Select Number__c from Auto__c where Type__C=:'old' order by CreatedDate desc limit 1])
                    {
                        ta.Number__c = oldauto.Number__c + 1;
                    }
            }       
        }
    }

}