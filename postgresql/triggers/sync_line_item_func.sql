-- Function: sync_line_item()

-- DROP FUNCTION sync_line_item();

CREATE OR REPLACE FUNCTION sync_line_item()
  RETURNS trigger AS
$BODY$
BEGIN
  IF tg_op = 'INSERT' THEN
     INSERT INTO salesforce.ecom_line_item__c (Name, order_id__c, product_id__c, quantity__c, product_name__c, product_description__C, product_price__C, createddate, lastmodifieddate)
     VALUES (NEW.id, NEW.order_id, NEW.product_id, NEW.quantity, NEW.product_name, NEW.product_description, NEW.product_price, NEW.created_at, NEW.updated_at);
     RETURN new;
  END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sync_line_item()
  OWNER TO iqnjsivcnmampd;
