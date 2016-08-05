public class ParkLocator {
    public static String[] country(String countryname){
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
		String[] result = parks.byCountry(countryname);
		System.debug(result);
        return result;
    }

}