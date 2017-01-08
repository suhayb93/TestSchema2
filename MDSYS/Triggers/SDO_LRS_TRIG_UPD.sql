CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_LRS_TRIG_UPD
INSTEAD OF UPDATE ON mdsys.user_sdo_lrs_metadata
REFERENCING OLD AS old NEW AS n
FOR EACH ROW
declare
 user_name      varchar2(32);
 stmt           varchar2(2048);
 vcount         INTEGER;
BEGIN

  EXECUTE IMMEDIATE
  'SELECT user FROM dual' into user_name;

    UPDATE sdo_lrs_metadata_table
    SET (SDO_TABLE_NAME, SDO_COLUMN_NAME, SDO_DIM_POS, SDO_DIM_UNIT)  =
     (SELECT nls_upper(:n.table_name), nls_upper(:n.column_name),:n.dim_pos, nls_upper(:n.dim_unit) FROM DUAL)
    WHERE SDO_OWNER       = nls_upper(user_name)
      AND SDO_TABLE_NAME  = nls_upper(:old.table_name)
      AND SDO_COLUMN_NAME = nls_upper(:old.column_name);
END;
/