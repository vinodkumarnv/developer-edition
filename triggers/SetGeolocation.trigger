// Trigger runs getLocation() on Accounts with no Geolocation
trigger SetGeolocation on Account (after insert, after update) {
    for (Account a : trigger.new){
        if(Trigger.isUpdate){
            if(a.BillingStreet != Trigger.oldMap.get(a.id).BillingStreet || a.BillingCity != Trigger.oldMap.get(a.id).BillingCity || a.BillingPostalCode != Trigger.oldMap.get(a.id).BillingPostalCode){
                LocationCallouts.getLocation(a.id);
            }
        }
        if (a.Location__Latitude__s == null)
            LocationCallouts.getLocation(a.id);
}
}