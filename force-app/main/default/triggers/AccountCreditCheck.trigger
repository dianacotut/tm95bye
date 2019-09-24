trigger AccountCreditCheck on Case (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        List<Id> accountsIds = new List<Id>();
        for(Case caseRecord: Trigger.new){
            accountsIds.add(caseRecord.AccountId);
        }
        Map<Id,Account> accounts = new Map<Id,Account>([SELECT Id,Credit_Check_Status__c FROM Account WHERE Id IN :accountsIds]);
        List<Account> accountsToUpdate = new List<Account>();
        for(Case caseRecord: Trigger.new){
            Account parentAccount = accounts.get(caseRecord.AccountId);
            parentAccount.Credit_Check_Status__c = caseRecord.Credit_Check_Status__c;
            accountsToUpdate.add(parentAccount);
        }
        update accountsToUpdate;
    }
}