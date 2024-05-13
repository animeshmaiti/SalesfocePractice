@isTest
private class DailyLeadProcessorTest {
    private static String CRON_EXP = '0 0 0 ? * * *'; // Every day at midnight
    
    @isTest
    private static void testScheduleableClass() {
        // Load the test data
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < 500; i++) {
            if (i<250) {
                leads.add(new Lead(LastName = 'Lead', Company = 'Salesforce'));
            } else {
                leads.add(new Lead(LastName = 'Lead', Company = 'Salesforce', LeadSource = 'Other'));
            }
        }
        insert leads;

        // Perform the test
        Test.startTest();
        String jobId = System.schedule('Process Leads', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();

        // Verify the results
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(),'ERROR: The number of updated leads is not correct');
        
        //check the schedule time
        List<CronTrigger> cts = [SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobId];
        System.debug('NextFireTime: ' + cts[0].NextFireTime);
    }
}