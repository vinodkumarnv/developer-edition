trigger testotrigger on Account (before insert) 
{
	System.debug('Hi i am from salesforce');
}