//Trigger to associate order with correct person account, once it is synchronized with Heroku Connect
//
//
//

trigger update_order on Order__c (before insert, before update) {

    Map<Id, Account> omap = new Map<Id, Account>([SELECT Id FROM Account where PersonEmail in :Trigger.newMap.keySet()]);
//  Account a = [SELECT Id FROM Account where PersonEmail = 'ndrost@salesforce.com'];
    
    System.debug(omap.size());
    
    for (Order__c o : Trigger.new)
    {   
    //  o.Account__c = omap.get;
        System.debug(o);
    }
}