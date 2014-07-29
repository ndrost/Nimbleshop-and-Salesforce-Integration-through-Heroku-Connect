-- Trigger: sync_orders_trig on orders

-- DROP TRIGGER sync_orders_trig ON orders;

CREATE TRIGGER sync_orders_trig
  AFTER INSERT OR UPDATE
  ON orders
  FOR EACH ROW
  EXECUTE PROCEDURE sync_orders();
