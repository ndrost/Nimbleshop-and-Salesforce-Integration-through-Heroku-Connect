-- Function: sync_orders()

-- DROP FUNCTION sync_orders();

CREATE OR REPLACE FUNCTION sync_orders()
  RETURNS trigger AS
$BODY$
BEGIN
  IF tg_op = 'INSERT' THEN
     INSERT INTO salesforce.order__c (shipping_method_id__c, email__c, payment_method_id__c, shipping_status__c, createddate, lastmodifieddate, status__c, Name, payment_status__c, ecom_ord_id__c)
     VALUES (NEW.shipping_method_id, NEW.email, NEW.payment_method_id, NEW.shipping_status, NEW.created_at, NEW.updated_at, NEW.status, NEW.number, NEW.payment_status, NEW.id);
     RETURN new;
  END IF;
  IF tg_op = 'UPDATE' THEN
    UPDATE salesforce.order__c 
      SET (shipping_method_id__c, email__c, payment_method_id__c, shipping_status__c, createddate, lastmodifieddate, status__c, Name, payment_status__c, ecom_ord_id__c)
      = (NEW.shipping_method_id, NEW.email, NEW.payment_method_id, NEW.shipping_status, NEW.created_at, NEW.updated_at, NEW.status, NEW.number, NEW.payment_status, NEW.id)
      WHERE NEW.number = Name;
      return NEW;
  END IF;
  RAISE NOTICE 'myplpgsqlval is currently %', myplpgsqlval;  
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sync_orders()
  OWNER TO iqnjsivcnmampd;
