@isTest
private class LeadProcessorTest {

    @isTest
    private static void testBatchClass() {
        // Load test data
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < 200; i++) {
            leads.add(new Lead(LastName = 'Connock', Company = 'Salesforce'));
        }
        insert leads;

        // Start test
        Test.startTest();
        LeadProcessor batch = new LeadProcessor();
        Id batchId = Database.executeBatch(batch,200);
        Test.stopTest();

        // Verify results
        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(),'Error: at least one lead was not updated.');
    }
}