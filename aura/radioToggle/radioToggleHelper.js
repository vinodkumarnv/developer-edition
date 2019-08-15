({
    doInit : function(component, event, helper) {

        var action = component.get("c.getQuestionAnswers");

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var returnVal = response.getReturnValue();
                var finalList = [];
                for(var i=0; i<returnVal.length; i++)
                {
                    var answers = returnVal[i].Answers__r;
                    console.log(answers);
                    //append label and value into the list.
                    for(var j=0; j<answers.length; j++)
                    {
                        answers[j].label = answers[j].Option__c;
                        answers[j].value = answers[j].Option__c;
                    }
                    finalList.push(returnVal[i]);         
                }
                console.log(JSON.stringify(finalList));
                component.set("v.Questions", finalList);
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    }
})