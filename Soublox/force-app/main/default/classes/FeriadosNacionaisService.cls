public with sharing class FeriadosNacionaisService {
    
    @future(callout=true)
    public static void getHolidays(string year) {

        BrasilAPIEntity entity = new BrasilAPIEntity('FeriadosNacionais', year);

        String responseBody = String.valueOf(entity.connect());

        String bodyReplaced = responseBody.replace('date', 'holidayDate');

        List<HolidayVO> holidaysList = (List<HolidayVO>) JSON.deserialize(bodyReplaced, List<HolidayVO>.class);

        saveRecords(holidaysList);

    }

    private static void saveRecords(List<HolidayVO> holidaysList) {

        List<National_Holidays__c> holidayRecords = new List<National_Holidays__c>();

        for (HolidayVO h : holidaysList) {

            holidayRecords.add(new National_Holidays__c(
                    Name = h.name,
                    Type__c = h.Type,
                    Date__c = Date.valueOf(h.holidayDate)
                )
            );

        }

        if (holidayRecords.size() > 0) 
            insertRecords(holidayRecords);
        else
            throw new FeriadosNacionaisServiceException('No records was retrieved from API');

    }

    private static void insertRecords(List<National_Holidays__c> holidayRecords) {

        try {
            insert holidayRecords;
        } catch(DMLException e) {
            System.debug('Error on saving National_Holidays__c: ' + e.getMessage() + e.getCause());
        }

    }

    public class FeriadosNacionaisServiceException extends Exception {}

}