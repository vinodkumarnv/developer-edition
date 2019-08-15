public class TestController
{
	@AuraEnabled
	public static String getString() 	 
	{
	    String str = 'Hi I am called from child component Server';
	    return str;
	}
}