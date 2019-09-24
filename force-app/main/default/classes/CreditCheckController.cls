public with sharing class CreditCheckController {
    @AuraEnabled
    public static void createCaseRecord(Case caseRecord){
        try{
            System.debug('CreateCaseRecord::CreateCaseRecord::create' + caseRecord);
            if(caseRecord != null){
                insert caseRecord;
            }
        } catch(Exception e){

        }
        
    }
}
