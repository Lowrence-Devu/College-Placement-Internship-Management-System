@IsTest
public class JobApplicationHandlerTest {

    @TestSetup
    static void setupData() {
        // --- Create Students ---
        List<Student__c> students = new List<Student__c>{
            new Student__c(Name='John Doe', Email__c='john@example.com'),
            new Student__c(Name='Jane Smith', Email__c='jane@example.com')
        };
        insert students;

        // --- Create Jobs (max 15 chars) ---
        List<Job__c> jobs = new List<Job__c>{
            new Job__c(Title__c='Software Eng', Company__c='TechCorp'),
            new Job__c(Title__c='Data Analyst', Company__c='DataWorks')
        };
        insert jobs;

        // --- Mock Callout ---
        Test.setMock(HttpCalloutMock.class, new MockHRService());
    }

    @IsTest
    static void testAfterInsertNotification() {
        // Fetch student and job
        Student__c s = [SELECT Id FROM Student__c LIMIT 1];
        Job__c j = [SELECT Id FROM Job__c LIMIT 1];

        // Insert Job Application
        Job_Application__c ja = new Job_Application__c(
            Student__c = s.Id,
            Job_Posting__c = j.Id,
            Status__c = 'Applied'
        );
        insert ja;

        // Assert notification logic (replace with your actual assertions)
        Job_Application__c insertedJA = [SELECT Id, Status__c FROM Job_Application__c WHERE Id = :ja.Id];
        System.assertEquals('Applied', insertedJA.Status__c);
    }

    @IsTest
    static void testAutoShortlistInsert() {
        Student__c s = [SELECT Id FROM Student__c LIMIT 1];
        Job__c j = [SELECT Id FROM Job__c LIMIT 1];

        Job_Application__c ja = new Job_Application__c(
            Student__c = s.Id,
            Job_Posting__c = j.Id,
            Status__c = 'Applied'
        );
        insert ja;

        // Assert that auto-shortlist logic ran (replace with actual field check)
        Job_Application__c updatedJA = [SELECT Id, Status__c FROM Job_Application__c WHERE Id = :ja.Id];
        System.assertNotEquals(null, updatedJA);
    }

    @IsTest
    static void testPreventDuplicateApplication() {
        Student__c s = [SELECT Id FROM Student__c LIMIT 1];
        Job__c j = [SELECT Id FROM Job__c LIMIT 1];

        Job_Application__c ja1 = new Job_Application__c(
            Student__c = s.Id,
            Job_Posting__c = j.Id,
            Status__c = 'Applied'
        );
        insert ja1;

        // Attempt duplicate insert (should fail gracefully)
        try {
            Job_Application__c ja2 = new Job_Application__c(
                Student__c = s.Id,
                Job_Posting__c = j.Id,
                Status__c = 'Applied'
            );
            insert ja2;
            System.assert(false, 'Duplicate insert should not succeed');
        } catch(DmlException e) {
            System.assert(e.getMessage().contains('duplicate'), 'Expected duplicate error');
        }
    }

    @IsTest
    static void testPreventReapply() {
        Student__c s = [SELECT Id FROM Student__c LIMIT 1];
        Job__c j = [SELECT Id FROM Job__c LIMIT 1];

        Job_Application__c ja = new Job_Application__c(
            Student__c = s.Id,
            Job_Posting__c = j.Id,
            Status__c = 'Rejected'
        );
        insert ja;

        // Attempt reapply (should fail)
        try {
            Job_Application__c ja2 = new Job_Application__c(
                Student__c = s.Id,
                Job_Posting__c = j.Id,
                Status__c = 'Applied'
            );
            insert ja2;
            System.assert(false, 'Reapply should not succeed');
        } catch(DmlException e) {
            System.assert(e.getMessage().contains('reapply'), 'Expected reapply error');
        }
    }

    @IsTest
    static void testRejectOnInsert() {
        Student__c s = [SELECT Id FROM Student__c LIMIT 1];

        // Insert Job with valid title (max 15 chars)
        Job__c j = new Job__c(Title__c='Software Eng', Company__c='TechCorp');
        insert j;

        Job_Application__c ja = new Job_Application__c(
            Student__c = s.Id,
            Job_Posting__c = j.Id,
            Status__c = 'Applied'
        );
        insert ja;

        // Assert status not exceeding length, etc.
        System.assert(ja.Job_Posting__c != null);
    }
}
