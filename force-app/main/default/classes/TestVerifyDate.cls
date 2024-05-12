// date format is MM/DD/YYYY
@isTest
private class TestVerifyDate{
    @istest
    static void Test_CheckDates_case1 (){
        Date D = VerifyDate.CheckDates(System.today(),System.today()+1);
        system.assertEquals(System.today()+1,D);
    }
    @istest
    static void Test_CheckDates_case2 (){
        Date D = VerifyDate.CheckDates(System.today(),System.today()+60);
        // current date is 05/12/2024, so the end of the month is 05/31/2024
        system.assertEquals(date.parse('05/31/2024'),D);
    }
    // If you want test all function you need @TestVisible to access private method
    @istest
    static void Test_DateWithin30Days_case1 (){
        Boolean B = VerifyDate.DateWithin30Days(date.parse('01/01/2024'),date.parse('12/30/2024'));
        system.assertEquals(false,B);
    }
    @istest
    static void Test_DateWithin30Days_case2 (){
        Boolean B = VerifyDate.DateWithin30Days(date.parse('01/01/2024'),date.parse('02/02/2024'));
        system.assertEquals(false,B);
    }
    @istest
    static void Test_DateWithin30Days_case3 (){
        Boolean B = VerifyDate.DateWithin30Days(date.parse('01/01/2024'),date.parse('01/15/2024'));
        system.assertEquals(true,B);
    }

    @istest
    static void Test_SetEndOfMonthDate_case1 (){
        Date D = VerifyDate.SetEndOfMonthDate(date.parse('01/01/2024'));
        system.assertEquals(date.parse('01/31/2024'),D);
    }
}