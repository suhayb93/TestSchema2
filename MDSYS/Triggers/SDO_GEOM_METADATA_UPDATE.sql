CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_GEOM_METADATA_UPDATE
AFTER UPDATE OR DELETE ON mdsys.SDO_GEOM_METADATA_TABLE
FOR EACH ROW
BEGIN
  mdsys.mdprvt_gmd.invalidate_geom_metadata(:old.sdo_owner,
                                            :old.sdo_table_name,
                                            :old.sdo_column_name);
END;
/