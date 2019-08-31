public class ParentTestController {
	@AuraEnabled(cacheable=true)
	public static String getString() {
		return 'Hi I am Iron Man';
	}

	@AuraEnabled(cacheable=true)
	public static String getStringByParam(String a){
		if(a == 'parameter') {
			return 'I am here for the param value='+a+'.';
		}
		return 'No parameters where passed.';
	}
}