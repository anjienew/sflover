@isTest
private class AnimalLocatorTest {
    @isTest
    static void test(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(1);
        System.assertEquals(result, 'chicken');
    }
}