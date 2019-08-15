public with sharing class custcontroller 
{
    
    public List<contact> contacts {get;set;}   
     
    public List<contact> con
    {
        get;
        set;
    }    
    public integer removepos
    {
        get;
        set;
    }    

    public String cont 
    {
        get;        
        set 
        {
            cont = value; 
        }
    }
        
      
    public custcontroller()
    {
        contacts = [select id,Name,email,phone,leadsource,title from contact limit 100];
    }
    public void save()
    {
       // System.debug('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww'+contacts[0].id);
       update contacts;
    }
    
   public Pagereference test()
   {
        
        con= [select id from contact where id=:cont];
        //system.debug('@@@@@@@@@@@@@@'+con);
        delete con;
        pagereference ref = new pagereference('/apex/practicecode1?sfdc.tabName=01r280000008jXZ');
        ref.setredirect(True);
        return ref;   
   }
}

/*   
 if(contacts.size()>0)
        {
            for(Integer i=0;i<contacts.size();i++)
            {
                if(contacts[i].id==cont)
                {
                delete te;
                }
            }
            
            
                   }  */