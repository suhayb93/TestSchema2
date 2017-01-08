CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_GEOR_TRIG_DEL1
INSTEAD OF DELETE ON mdsys.user_sdo_geor_sysdata
FOR EACH ROW
DECLARE
  owner   VARCHAR2(32);
  valid   VARCHAR2(32);
BEGIN
  owner:=user;
  valid:=SDO_GEOR_DEF.isValidEntry(nls_upper(owner),nls_upper(:old.table_name),nls_upper(:old.column_name),nls_upper(:old.rdt_table_name),:old.raster_id);
  if(valid='TRUE')
  then
     mderr.raise_md_error('MD', 'SDO', -13391, 'A valid entry cannot be deleted directly.');
  end if;
  SDO_GEOR_DEF.deleteMetaEntry(user, :old.rdt_table_name, :old.raster_id);
END;
/