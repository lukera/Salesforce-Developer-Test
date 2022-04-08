@isTest
public class TaskTriggerHandlerTest {
    
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
    public static void testBeforeInsert() {

        Task t = getTask();

        Test.startTest();

        TaskTriggerHandler.beforeInsert(new List<Task> { t }, new Map<Id, Task> { t.Id => t });

        Test.stopTest();

    }

    @isTest
    public static void testBeforeUpdate() {

        Task t = getTask();

        Test.startTest();

        TaskTriggerHandler.beforeUpdate(new List<Task> { t }, new Map<Id, Task> { t.Id => t }, new List<Task> { t }, new Map<Id, Task> { t.Id => t });

        Test.stopTest();

    }

    @isTest
    public static void testAfterInsert() {

        Task t = getTask();

        Test.startTest();

        TaskTriggerHandler.afterInsert(new List<Task> { t }, new Map<Id, Task> { t.Id => t });

        Test.stopTest();

    }

    @isTest
    public static void testAfterUpdate() {

        Task t = getTask();

        Test.startTest();

        TaskTriggerHandler.afterUpdate(new List<Task> { t }, new Map<Id, Task> { t.Id => t }, new List<Task> { t }, new Map<Id, Task> { t.Id => t });

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