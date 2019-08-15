trigger Re on Receip_t__c (Before insert) 
{
   //for "New" Type.
    //a to hold the Array of new values, that should be updated.
    //list<Auto__C> a = new list<Auto__c>();
    //to get the count of Existing Records.
    
    List<AggregateResult> Sumss = new List<AggregateResult>();
    //Integer Existingcount = 0;
   // Integer oldcount = 0;
   
    System.debug('Hi I am Trigger');        
  
    for( Receip_t__c ta: Trigger.new)
    {
            
            
            Integer countz = [Select count() from Receip_t__c where Opportunity__c=:ta.Opportunity__c];
            
            List<Opportunity> op =new List<Opportunity>();
            op= [Select Amount from Opportunity where id=:ta.Opportunity__c];
            Decimal x = 0;
            System.debug('7777777777'+ta);
            
            if(countz == 0)
            {
                ta.Due_Amount__c = op[0].Amount - ta.Amount_Paid__c;    
            
            }
            else
            {
                Sumss = [Select sum(Amount_Paid__c)seven from Receip_t__c where Opportunity__c=:ta.Opportunity__c and Amount_Paid__c != null];
                if(Sumss.size() != null)
                {
                   string a = '' + sumss[0].get('seven');
                   System.debug('PPPPPPPPPPPPPPPPPPPPPPPPPP'+a+'');
                   string b = a.remove('null');
                   System.debug('SSSSSSSSSSSSSSSSSSSSSSS'+b);
                   x = op[0].Amount  - (Decimal.valueof(b)+ta.Amount_Paid__c);
   
                }             
                ta.Due_Amount__c = x;
           }
           
    }

}