-- Trigger: sync_line_items_trig on line_items

-- DROP TRIGGER sync_line_items_trig ON line_items;

CREATE TRIGGER sync_line_items_trig
  AFTER INSERT
  ON line_items
  FOR EACH ROW
  EXECUTE PROCEDURE sync_line_item();
