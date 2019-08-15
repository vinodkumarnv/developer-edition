global with sharing class FindNearby {

    public FindNearby(ApexPages.StandardSetController controller) { }
    
   

    @RemoteAction
    // Find Accounts nearest a geolocation
    global static List<account> getNearby(String lat, String lon) {

        // If geolocation isn't set, use Eindhoven (or any other city)
        // Put a default location latitue and longitude here, this could be where you are located the most
        // and will only be used as a backup if the browser can not get your location details
        if(lat == null || lon == null || lat.equals('') || lon.equals('')) {
            lat = '51.096214';
            lon = '3.683153';
        }

        // SOQL query to get the nearest accounts
        //you can change km (kilometers) into mi (miles)
        // < 20 means within a radius of 20 km or mi (you can change that)
        //limit 25 shows 25 records (you can adapt that too if you want)
        String queryString =
            'SELECT Id, Name, Location__Longitude__s, Location__Latitude__s, ' +
                'BillingStreet, Phone, BillingCity ' +
            'FROM Account ' +
            'WHERE DISTANCE(Location__c, GEOLOCATION('+lat+','+lon+'), \'km\') < 20 ' +
            'ORDER BY DISTANCE(Location__c, GEOLOCATION('+lat+','+lon+'), \'km\') ' +
            'LIMIT 25';

        // Run and return the query results
        return(database.Query(queryString));
    }
}