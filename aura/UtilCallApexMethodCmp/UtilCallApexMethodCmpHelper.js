({
	callApexMethod: function (callerComponent, controllerMethod, actionParameters, helper, helperMethodName) {
		var action = callerComponent.get(controllerMethod);
		if (actionParameters) {
			action.setParams(actionParameters);
		}
		action.setCallback(this, function (response) {
			var state = response.getState();
			console.log(state);
			if (state === "SUCCESS") {
				var returnValue = JSON.parse(JSON.stringify(response.getReturnValue()));
				// Calling our callback method
				if (helperMethodName !== '' && helperMethodName !== undefined && helperMethodName != null) {
					helper[helperMethodName](callerComponent, helper, returnValue);
				}
			} else if (state === "INCOMPLETE") {
				// TODO Make this better
				console.log("Action INCOMPLETE");
			} else if (state === "ERROR") {
				// TODO Make this better
				var errors = response.getError();
				if (errors) {
					if (errors[0] && errors[0].message) {
						console.log("Error message: " + errors[0].message);
					}
				}
			} else {
				// TODO Make this better
				console.log(response);
			}
		});
		$A.enqueueAction(action);
	}
})