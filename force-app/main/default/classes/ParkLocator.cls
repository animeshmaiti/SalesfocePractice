public with sharing class ParkLocator {
    public static List<String> Country(String country){
        ParkService.ParksImplPort prkSvc = new ParkService.ParksImplPort();
        return prkSvc.byCountry(country);
    }
}