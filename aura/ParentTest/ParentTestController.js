({
	getData: function (component, event, helper) {
		component.find("TestCmp")
			.CallApexMethod(component, 'c.getString', false, helper, 'helperMethod');
	}
})