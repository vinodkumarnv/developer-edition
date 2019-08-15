public class VFCodeController
{
    //hold boolean to show Code at VF
    public boolean showCodeSection {get; set;}
 
    //To hold VF Code as text
    public String VFpageText {get; set;}
    public String HTMLpageText {get; set;}
 
    //Hold inputted page name
    public String vfName {get; set;}
 
    public VFCodeController()
    {
        showCodeSection = false ;
    }
 
    public PageReference ShowVFCode()
    {
        if(vfName !=  NULL)
        {
            //Fetching VF code
            ApexPage vfPage = [Select Id, Markup from ApexPage where name =: vfName];
            VFpageText = vfPage.markup ;
 
            //fetch HTML source
            PageReference pr = new PageReference('/apex/'+vfName);
            HTMLpageText = pr.getContent().toString();
 
            showCodeSection = true ;
        }
        return null ;
    }
}