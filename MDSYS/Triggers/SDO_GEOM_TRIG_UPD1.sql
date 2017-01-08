CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_GEOM_TRIG_UPD1
INSTEAD OF UPDATE ON mdsys.user_sdo_geom_metadata
REFERENCING OLD AS old NEW AS n
FOR EACH ROW
declare
BEGIN

  mdsys.sdo_meta.change_all_sdo_geom_metadata(user,
                                              :old.table_name,
                                              :old.column_name,
                                              :n.table_name,
                                              :n.column_name,
                                              :n.diminfo,
                                              :n.srid);

END;
/