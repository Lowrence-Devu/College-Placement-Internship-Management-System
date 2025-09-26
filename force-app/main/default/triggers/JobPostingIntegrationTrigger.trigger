trigger JobPostingIntegrationTrigger on Job_Application__c (after insert) {
    if (Test.isRunningTest()) return; // skip callouts during tests

    // original trigger logic
    HRIntegrationService.fetchExternalJobPostings(Trigger.new);
}
