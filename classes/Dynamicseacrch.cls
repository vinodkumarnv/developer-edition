public class Dynamicseacrch {

 
    public List<university__c> selected{get;set;}
    public String getwrapperObj { get; set; }

    public String univ { get; set; }
    Public List<WrapperClassEx> WrapperList{get;set;}

    
 //public string counti {get;set;}
 //public string country {get;set;}

 public list<university__c> queryResult {get;set;}
 private string soql{get;set;}
 public string name {get;set;}

 
 
  public Dynamicseacrch(){
       
       system.debug('@@@@@'+name);
     }
 

/* public List<SelectOption> getcount(){
 
 list<selectoption> options= new list<selectoption>();
 list<University__c> conti= [select Country__c from University__c order by Country__c];
 options.add(new selectoption('--None--','--None--'));
 options.add(new selectoption('--None--','--None--'));
 for (University__c uni :conti)
 {
 
 options.add(new selectoption (uni.country__c,uni.country__c));
 }
  
  return options;
 
 } */
 

//To get University Name Picklist
/*public List<SelectOption> getcount(){

 
        list<selectoption> options= new list<selectoption>();
        Schema.DescribeFieldResult fieldResult = University__c.Country__c.getDescribe();
        List<Schema.PicklistEntry> coun = fieldResult.getPicklistValues();
        options.add(new SelectOption('None', '--None--')); 
        for(Schema.PicklistEntry p : coun)
        {
        options.add(new SelectOption(p.getvalue(), p.getValue())); 
        }
      return options;  
 }*/ 
 
 
 public List<SelectOption> getcount(){

 
        list<selectoption> options= new list<selectoption>();
        Schema.DescribeFieldResult fieldResult = University__c.Country__c.getDescribe();
        List<Schema.PicklistEntry> coun = fieldResult.getPicklistValues();
        options.add(new SelectOption('None', '--None--')); 
        for(Schema.PicklistEntry p : coun)
        {
        options.add(new SelectOption(p.getvalue(), p.getValue())); 
        }
      return options;  
 }

/*public pagereference univ(){

system.debug('@@@@@'+name);
string name1=name;
String qryString = 'SELECT Id,Name,Country__c FROM university__c WHERE ' +' (Country__c like \'%' + name1 + '%\')';
queryResult = Database.query(qryString);

return null;
}*/

public void processSelected() {             
        selected=new List<University__c>();
        System.debug('777777766666666'+selected); 
        for(WrapperClassEx cCon:  WrapperList) {
            if(cCon.checkBox==true) {
                selected.add(cCon.accObj);
                
            }
            
        }
        System.debug('77777777777777'+selected);
 
        
      
    }

Public List<WrapperClassEx> getwrapperObj(){
      string name1=name;
     String qryString = 'SELECT Id,Name,Country__c FROM university__c WHERE ' +' (Country__c like \'%' + name1 + '%\')';
     queryResult = Database.query(qryString);
     // system.debug('asdfgh'+qryString);
      WrapperList = New List<WrapperClassEx>();
      for(university__c acc: queryResult){
        WrapperList.add(New WrapperClassEx(acc,false)); 
        system.debug('777777777'+WrapperList);
      }
      return WrapperList;
   } 
  
Public Class WrapperClassEx{
     Public university__c accObj{get;set;}
     Public Boolean checkBox{get;set;}
    
     Public WrapperClassEx(university__c accRec, boolean SelectBox){
        accObj = accRec;
        checkBox = SelectBox;
     }
}
}