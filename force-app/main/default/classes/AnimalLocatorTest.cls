@isTest
private class AnimalLocatorTest {

    @isTest
    static void animalLocatorTest1() {
        Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
        String actual = AnimalLocator.getAnimalNameById(1);
        String excepted = 'moose';
        System.assertEquals(actual, excepted);
    }
}