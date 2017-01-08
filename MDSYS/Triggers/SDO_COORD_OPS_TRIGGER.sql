CREATE OR REPLACE NONEDITIONABLE TRIGGER
  mdsys.SDO_COORD_OPS_TRIGGER
BEFORE
  INSERT OR
  UPDATE OR
  DELETE
ON
  mdsys.SDO_COORD_OPS
FOR EACH ROW
BEGIN
  mdsys.sdo_cs.sdo_cs_context_invalidate;
END;
/