@isTest
private class TestRestrictContactByName {

    @isTest
    static void testContact() {
        Contact c = new Contact();
        c.LastName = 'INVALIDNAME';
        Database.SaveResult sr = Database.insert(c, false);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', res.getErrors()[0].getMessage());
    }
}