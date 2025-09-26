trigger JobApplicationTrigger on Job_Application__c (before insert, before update, after insert) {

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            JobApplicationHandler.handleBeforeInsert(Trigger.new);
        }
        if (Trigger.isUpdate) {
            JobApplicationHandler.handleBeforeUpdate(Trigger.oldMap, Trigger.new);
        }
    }

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            JobApplicationHandler.handleAfterInsert(Trigger.new);
        }
    }
}