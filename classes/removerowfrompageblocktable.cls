public class removerowfrompageblocktable
{
    public list<contact>con{get;set;}
    public string conid{get;set;}
    public integer removepos{get;set;}
    public removerowfrompageblocktable ()
    {
        con=[select id,name,email from contact limit 1000];
    }
    
    public void removecon()
    {
        if(con.size()>0)
        {
            for(Integer i=0;i<con.size();i++)
            {
                if(con[i].id==conid)
                {
                    removepos=i;
                }
            }
            con.remove(removepos);
           
        }
    }
   
}