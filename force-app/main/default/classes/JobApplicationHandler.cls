public class JobApplicationHandler {

    // BEFORE INSERT
    public static void handleBeforeInsert(List<Job_Application__c> newApps) {

        // Collect Job Posting Ids
        Set<Id> jobIds = new Set<Id>();
        for (Job_Application__c app : newApps) {
            jobIds.add(app.Job_Posting__c);
        }

        // Get related job postings
        Map<Id, Job_Posting__c> jobMap = new Map<Id, Job_Posting__c>(
            [SELECT Id, Eligibility_CGPA__c FROM Job_Posting__c WHERE Id IN :jobIds]
        );

        // Prevent duplicate applications
        Set<String> existingKeys = new Set<String>();
        for (Job_Application__c existing : [
            SELECT Job_Posting__c, Applicant__c
            FROM Job_Application__c
            WHERE Job_Posting__c IN :jobIds
        ]) {
            existingKeys.add(existing.Job_Posting__c + '-' + existing.Applicant__c);
        }

        // Apply logic
        for (Job_Application__c app : newApps) {
            String key = app.Job_Posting__c + '-' + app.Applicant__c;
            if (existingKeys.contains(key)) {
                app.addError('You have already applied to this job.');
            }

            Job_Posting__c job = jobMap.get(app.Job_Posting__c);
            if (job != null) {
                if (app.CGPA__c < job.Eligibility_CGPA__c) {
                    app.Status__c = 'Rejected';
                } else if (app.CGPA__c >= job.Eligibility_CGPA__c + 1 && app.Status__c == 'Applied') {
                    app.Status__c = 'Shortlisted';
                }
            }
        }
    }

    // BEFORE UPDATE
    public static void handleBeforeUpdate(Map<Id, Job_Application__c> oldMap, List<Job_Application__c> newApps) {
        for (Job_Application__c app : newApps) {
            Job_Application__c oldApp = oldMap.get(app.Id);

            // Prevent re-apply if previously rejected
            if (oldApp.Status__c == 'Rejected' && app.Status__c == 'Applied') {
                app.addError('You cannot re-apply once rejected.');
            }

            // Dynamic CGPA logic
            Job_Posting__c job = [SELECT Eligibility_CGPA__c FROM Job_Posting__c WHERE Id = :app.Job_Posting__c LIMIT 1];
            if (app.CGPA__c >= job.Eligibility_CGPA__c + 1 && app.Status__c == 'Applied') {
                app.Status__c = 'Shortlisted';
            }
        }
    }

    // AFTER INSERT
    public static void handleAfterInsert(List<Job_Application__c> newApps) {
        // Get HR users
        List<User> hrUsers = [SELECT Id FROM User WHERE Profile.Name = 'HR Manager' AND IsActive = true];

        List<Task> tasks = new List<Task>();
        for (Job_Application__c app : newApps) {
            for (User hr : hrUsers) {
                Task t = new Task();
                t.OwnerId = hr.Id;
                t.Subject = 'New Job Application';
                t.WhatId = app.Id;
                t.Description = 'A new job application has been submitted by student ' + app.Applicant__c;
                t.Priority = 'High';
                t.Status = 'Not Started';
                tasks.add(t);
            }
        }

        if (!tasks.isEmpty()) {
            insert tasks;
        }
    }
}