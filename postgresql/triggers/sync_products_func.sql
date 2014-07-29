-- Function: salesforce.sync_products()

-- DROP FUNCTION salesforce.sync_products();

--Assumes salesforce schema

CREATE OR REPLACE FUNCTION salesforce.sync_products()
  RETURNS trigger AS
$BODY$
BEGIN
  IF tg_op = 'INSERT' THEN
     INSERT INTO products(name, price, permalink, created_at, updated_at, description, status, sfid)
     VALUES (new.name, CAST(new.price__c as numeric), new.name, new.createddate, new.lastmodifieddate, CAST(new.description as text), new.status__c, new.sfid);
     RETURN new;
  END IF;
  IF tg_op = 'UPDATE' THEN
      UPDATE products 
      SET (name, price, permalink, created_at, updated_at, description, status, sfid)
      = (new.name, CAST(new.price__c as numeric), new.name, new.createddate, new.lastmodifieddate, CAST(new.description as text), new.status__c, new.sfid)
      WHERE new.sfid = sfid;
      return new;
  END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION salesforce.sync_products()
  OWNER TO iqnjsivcnmampd;
