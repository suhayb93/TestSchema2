CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_GEOM_TRIG_DEL1
INSTEAD OF DELETE ON mdsys.user_sdo_geom_metadata
REFERENCING OLD AS n
FOR EACH ROW
declare
BEGIN

  mdsys.sdo_meta.delete_all_sdo_geom_metadata(user,
                                              :n.table_name,
                                              :n.column_name);

END;
/