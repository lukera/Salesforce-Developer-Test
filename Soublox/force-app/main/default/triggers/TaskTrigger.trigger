trigger TaskTrigger on Task (before insert, after insert, before update, after update) {
 
    // BEFORE
    if(Trigger.isBefore){
            
        // INSERT 
        if(Trigger.isInsert){
            TaskTriggerHandler.beforeInsert(Trigger.new, Trigger.newMap);
        }
        
        // UPDATE 
        if(Trigger.isUpdate){
            TaskTriggerHandler.beforeUpdate(Trigger.new, Trigger.newMap,Trigger.old,Trigger.oldMap);
        }
        
    }
    
    // AFTER
    if(Trigger.isAfter){
        
        // INSERT
        if(Trigger.isInsert){
            TaskTriggerHandler.afterInsert(Trigger.new, Trigger.newMap);
        }
        
        // UPDATE
        if (Trigger.isUpdate) {
            TaskTriggerHandler.afterUpdate(Trigger.new, Trigger.newMap,Trigger.old,Trigger.oldMap);
        }
        
    }
    
}