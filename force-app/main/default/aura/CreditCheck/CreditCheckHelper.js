({
    saveCase : function(cmp, caseRecord) {
        console.log(cmp.find('creditCheckStatus').get('v.value'));
        var action = cmp.get(c.createCaseRecord);
        action.setParams({
            "caseRecord": caseRecord
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                $A.get("e.force:closeQuickAction").fire();
            }
        });
        $A.enqueueAction(action);
   }
})
