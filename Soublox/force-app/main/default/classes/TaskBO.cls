public with sharing class TaskBO {
    
    public static void validateHoliday(List<Task> taskList) {

        List<National_Holidays__c> holidayList = [SELECT Date__c FROM National_Holidays__c ORDER BY Date__c DESC LIMIT 200];

        for (Task task : taskList) {
            
            for (National_Holidays__c holiday : holidayList) {

                if (task.ActivityDate == holiday.Date__c) {
                    task.Is_Holiday__c = true;
                    break;
                } else {
                    task.Is_Holiday__c = false;
                }
                
            }
        }
    }
}