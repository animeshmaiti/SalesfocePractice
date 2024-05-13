@isTest
private class AccountProcessorTest {

    @isTest
    static void countContactsTest() {
        // Load test data
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 200; i++) {
            accounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert accounts;

        List<Contact> contacts = new List<Contact>();
        List<Id> accountIds = new List<Id>();
        for(Account acc : accounts) {
            contacts.add(new Contact(FirstName=acc.Name, LastName = 'TestContact', AccountId = acc.Id));
            accountIds.add(acc.Id);
        }
        insert contacts;

        // Do the test
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();

        // Verify the results
        List<Account> accs = [SELECT Id, Number_Of_Contacts__c FROM Account];
        for(Account acc : accs) {
            System.assertEquals(1,acc.Number_Of_Contacts__c, 'ERROR: atleast one account has wrong number of contacts');
        }
    }
}