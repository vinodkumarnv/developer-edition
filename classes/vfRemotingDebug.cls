global with sharing class vfRemotingDebug {
	public String accountName { get; set; }
	public static Account account { get; set; }
	public vfRemotingDebug() {

	}
	@RemoteAction
	global static Account getAccount(String accountName) {
		if(accountName != null) {
			account = [SELECT Id, Name, Phone, Type, NumberOfEmployees
			           FROM Account WHERE Name = :accountName];
		}
		return account;
	}
}