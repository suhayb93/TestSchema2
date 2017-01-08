CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_CS_SRS_SRID_INSERT
BEFORE INSERT ON mdsys.SDO_CS_SRS
FOR EACH ROW
BEGIN

  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:new.srid);
END;
/