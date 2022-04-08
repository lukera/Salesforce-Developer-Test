@isTest
public class TaskBOTest {

    @TestSetup
    static void setup(){
        
        National_Holidays__c holiday = createHoliday();
        insert holiday;

        Task t = createTask();
        insert t;

    }

    public static Task getTask() {
        return [SELECT Id, ActivityDate FROM Task LIMIT 1];
    }

    @isTest
    public static void shouldValidateHoliday() {

        Test.startTest();

        TaskBO.validateHoliday(new List<Task> { getTask() });

        Test.stopTest();

    }

    @isTest
    public static void shouldNotValidateHoliday() {

        Task t = getTask();
        t.ActivityDate = System.today()+2;
        update t;

        Test.startTest();

        TaskBO.validateHoliday(new List<Task> { t });

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