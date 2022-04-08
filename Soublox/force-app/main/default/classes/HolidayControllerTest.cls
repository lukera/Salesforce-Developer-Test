@isTest
public  class HolidayControllerTest {
    
    @TestSetup
    static void setup(){
        
        National_Holidays__c holiday = createHoliday();
        insert holiday;

    }

    public static National_Holidays__c getHoliday() {
        return [SELECT Id, Name, Date__c, Type__c FROM National_Holidays__c LIMIT 1];
    }

    @isTest
    public static void shouldGetNextHoliday() {

        Test.startTest();

        HolidayController.Response response = HolidayController.getHolidays();

        Test.stopTest();

        System.assert(response.isHoliday == false);

    }

    @isTest
    public static void shouldGetHoliday() {

        National_Holidays__c holiday = getHoliday();
        holiday.Date__c = System.today();
        update holiday;

        Test.startTest();

        HolidayController.Response response = HolidayController.getHolidays();

        Test.stopTest();

        System.assert(response.isHoliday == true);

    }

    public static National_Holidays__c createHoliday() {

        National_Holidays__c holiday = new National_Holidays__c(
            Name = 'Test',
            Type__c = 'National',
            Date__c = System.today()+2
        );

        return holiday;
    }

}