@IsTest
public class parentTestControllerTest {
	static testMethod void methodName() {
		ParentTestController.getString();
		String a = 'parameter';
		ParentTestController.getStringByParam(a);
		ParentTestController.getStringByParam('');
	}
}