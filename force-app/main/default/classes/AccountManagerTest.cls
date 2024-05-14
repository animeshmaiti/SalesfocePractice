@isTest
private class AccountManagerTest {

    @isTest
    static void myUnitTest() {
        Account a = new Account(Name='Test Account');
        insert a;
        Contact c = new Contact(FirstName='Test', LastName='Contact', AccountId=a.Id);
        insert c;

        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/Accounts/' + a.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account result = AccountManager.getAccount();
        System.assert(result != null);
        System.assertEquals('Rest Account', result.Name);
    }
}