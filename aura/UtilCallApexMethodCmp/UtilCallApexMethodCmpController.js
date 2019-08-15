({
	init: function (component, event, helper) {
		var params = event.getParams().arguments;
		var callerComponent = params.component;
		var controllerMethod = params.controllerMethod;
		var actionParameters = params.actionParameters;
		var componentHelper = params.componentHelper;
		var helperMethod = params.helperMethod;
		helper.callApexMethod(callerComponent, controllerMethod,
			actionParameters, componentHelper, helperMethod);
	}
})