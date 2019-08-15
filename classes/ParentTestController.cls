public class ParentTestController {
	@AuraEnabled(cacheable=true)
	public static String getString() {
		return 'Hi I am Iron Man';
	}
}