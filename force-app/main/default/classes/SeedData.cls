public class SeedData {
    @AuraEnabled
    public static void createSampleData() {
        // Students
        List<Student__c> students = new List<Student__c>{
            new Student__c(Name='John Doe', Email__c='john@example.com'),
            new Student__c(Name='Jane Smith', Email__c='jane@example.com'),
            new Student__c(Name='Alice Brown', Email__c='alice@example.com'),
            new Student__c(Name='Bob White', Email__c='bob@example.com')
        };
        insert students;

        // Jobs (Title__c ≤ 15 characters)
        List<Job__c> jobs = new List<Job__c>{
            new Job__c(Title__c='Software Eng', Company__c='TechCorp'),
            new Job__c(Title__c='Data Analyst', Company__c='DataWorks'),
            new Job__c(Title__c='Web Dev Intern', Company__c='WebSolutions'),
            new Job__c(Title__c='QA Tester', Company__c='TestLabs')
        };
        insert jobs;

        // Job Applications
        List<Job_Application__c> applications = new List<Job_Application__c>{
            new Job_Application__c(Student__c=students[0].Id, Job__c=jobs[0].Id),
            new Job_Application__c(Student__c=students[1].Id, Job__c=jobs[1].Id),
            new Job_Application__c(Student__c=students[2].Id, Job__c=jobs[2].Id),
            new Job_Application__c(Student__c=students[3].Id, Job__c=jobs[3].Id)
        };
        insert applications;

        // Feedback
        List<Feedback__c> feedbackList = new List<Feedback__c>{
            new Feedback__c(Feature__c='Student Dashboard', Feedback__c='Easy to use'),
            new Feedback__c(Feature__c='Job Portal', Feedback__c='Needs more filters'),
            new Feedback__c(Feature__c='Company Dashboard', Feedback__c='Very helpful')
        };
        insert feedbackList;
    }
}
