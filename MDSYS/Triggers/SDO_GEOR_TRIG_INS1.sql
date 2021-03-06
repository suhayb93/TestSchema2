CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_GEOR_TRIG_INS1
INSTEAD OF INSERT ON mdsys.user_sdo_geor_sysdata
FOR EACH ROW
DECLARE
  owner   VARCHAR2(32);
  valid   VARCHAR2(32);
BEGIN
  owner:=user;
  valid:=SDO_GEOR_DEF.isValidEntry(nls_upper(owner),nls_upper(:new.table_name),nls_upper(:new.column_name),nls_upper(:new.rdt_table_name),:new.raster_id);

  if(valid='FALSE')
  then
     mderr.raise_md_error('MD', 'SDO', -13391, 'The inserted entry is not valid.');
  end if;
  SDO_GEOR_INT.insertUserSysEntry(user, :new.table_name, :new.column_name,
      :new.metadata_column_name, :new.rdt_table_name, :new.raster_id,
      :new.other_table_names);
END;
/