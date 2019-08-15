public class ParkLocator {
    public static String[] country(string country)
    {
        ParkService.ParksImplPort ps = new ParkService.ParksImplPort();
        return ps.byCountry(country);
    }
}