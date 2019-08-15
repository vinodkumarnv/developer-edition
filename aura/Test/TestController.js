({
	getData : function(component, event, helper) 
	{		
		var action = component.get("c.getString");
		action.setCallback(this,function(response)
		{
			var state = response.getState();
			if(state == "SUCCESS")
			{
				var stringline = response.getReturnValue();
				component.set("v.line",stringline);
			}			
		});		
		$A.enqueueAction(action);
	}
})