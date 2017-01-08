CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_COORD_REF_SRID_INSERT
BEFORE INSERT ON mdsys.SDO_COORD_REF_SYS
FOR EACH ROW
BEGIN
  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:new.srid,
                                                 :new.coord_ref_sys_kind);
END;
/