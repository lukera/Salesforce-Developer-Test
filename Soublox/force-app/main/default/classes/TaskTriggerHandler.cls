public with sharing class TaskTriggerHandler {

    // BEFORE
    public static void beforeInsert(List<Task> newTasks, Map<Id, Task> mapNewTasks) {
        TaskBO.validateHoliday(newTasks);
    }

    public static void beforeUpdate(List<Task> newTasks, Map<Id, Task> mapNewTasks, List<Task> oldsTasks, Map<Id, Task> mapOldTasks){
		TaskBO.validateHoliday(newTasks);
    }

    // AFTER
    public static void afterInsert(List<Task> newTasks, Map<Id, Task> mapNewTasks){
		// Class.doTask();
    }

	public static void afterUpdate(List<Task> newTasks, Map<Id, Task> mapNewTasks, List<Task> oldsTasks, Map<Id, Task> mapOldTasks){
		// Class.doTask();
	}

}