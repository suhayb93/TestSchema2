CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_LRS_TRIG_DEL
INSTEAD OF DELETE ON mdsys.user_sdo_lrs_metadata
REFERENCING OLD AS n
FOR EACH ROW
declare
 user_name      varchar2(32);
 stmt           varchar2(2048);
 vcount         INTEGER;
BEGIN

  EXECUTE IMMEDIATE
  'SELECT user FROM dual' into user_name;

    DELETE FROM  sdo_lrs_metadata_table
    WHERE SDO_OWNER   = user_name
      AND SDO_TABLE_NAME  = nls_upper(:n.table_name)
      AND SDO_COLUMN_NAME = nls_upper(:n.column_name);
END;
/