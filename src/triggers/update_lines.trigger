//Trigger to associate incoming order line with order number after synchronized from Heroku Connect
//
//ToDo 
//	* still need to bulkify trigger

trigger update_lines on ecom_line_item__c (before insert, before update) {
    for (ecom_line_item__c eli : Trigger.new)
    {
        Order__c ovar = [SELECT Id FROM Order__c WHERE ecom_ord_id__c = :eli.Order_id__c];
        eli.Order__c = ovar.Id;
        System.debug(ovar);
    }
}