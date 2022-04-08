@isTest
public class TaskTriggerTest {

    @isTest
    public static void testContext() {

        Test.startTest();

        Task t = createTask();
        insert t;

        t.ActivityDate = System.today()+5;
        update t;

        Test.stopTest();

    }

    public static Task createTask() {

        Task t = new Task(
            ActivityDate = System.today()
        );

        return t;
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