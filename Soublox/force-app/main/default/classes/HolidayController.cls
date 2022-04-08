public with sharing class HolidayController {
    
    @AuraEnabled(cacheable=true)
    public static HolidayController.Response getHolidays() {

        HolidayController.Response response = new HolidayController.Response();

        List<National_Holidays__c> todaysHolidays =  [SELECT Name, Date__c FROM National_Holidays__c WHERE Date__c = TODAY];

        if (todaysHolidays.size() > 0) {
            response.holidays = todaysHolidays;
            response.isHoliday = true;
        } else {
            response.holidays = [SELECT Name, Date__c FROM National_Holidays__c WHERE Date__c > TODAY LIMIT 1];
            response.isHoliday = false;
            response.daysUntil = (System.today()).daysBetween(response.holidays[0].Date__c);
        }

        return response;
    }

    public class Response {
        @AuraEnabled
        public List<National_Holidays__c> holidays;
        @AuraEnabled
        public Boolean isHoliday;
        @AuraEnabled
        public Integer daysUntil;
    }
    
}