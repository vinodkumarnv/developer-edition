public class geo {
    
    contact c = new contact();
   public string FirstNamee {get; set;}
    public String LastNamee {get; set;}
    public Decimal LocLat{get; set;}
    public Decimal LocLong{get; set;}
    
    public geo(ApexPages.StandardController controller) {
    
    

    }
    
    public void sav()
    {
        c.FirstName = FirstNamee;
        c.LastName = LastNamee;
        c.Location_del__Latitude__s = LocLat;
        c.Location_del__Longitude__s = LocLong; 
        System.debug('Hi i am Controller');
        insert c;
    }

}