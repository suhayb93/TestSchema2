CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_LRS_TRIG_INS
INSTEAD OF INSERT ON mdsys.user_sdo_lrs_metadata
REFERENCING NEW AS n
FOR EACH ROW
declare
 user_name      varchar2(32);
 stmt           varchar2(2048);
 vcount         INTEGER;
BEGIN

  EXECUTE IMMEDIATE
  'SELECT user FROM dual' into user_name;

  if ( (instr(:n.table_name, ' ') > 0) OR
       (instr(:n.table_name, '''') > 0)  ) then
   mderr.raise_md_error('MD', 'SDO', -13223,
               :n.table_name||'.'||:n.column_name);
   end if;

  if ( (instr(:n.column_name, ' ') > 0) OR
   (instr(:n.column_name, '''') > 0)  ) then
   mderr.raise_md_error('MD', 'SDO', -13223,
               :n.table_name||'.'||:n.column_name);
   end if;

/*
  stmt :=  'SELECT count(*) FROM SDO_LRS_METADATA_TABLE ' ||
  ' WHERE sdo_owner = '''   || nls_upper(user_name) || '''  ' ||
  '  AND  sdo_table_name = '''  || nls_upper(replace(:n.table_name,'''',''))
   || ''' ' ||
 ' AND  sdo_column_name = ''' || nls_upper(replace(:n.column_name,'''',''))|| ''' ';
  */

  stmt :=  'SELECT count(*) FROM SDO_LRS_METADATA_TABLE ' ||
  ' WHERE sdo_owner = :owner  AND  sdo_table_name =  :tab ' ||
  ' AND  sdo_column_name = :col ';

 EXECUTE IMMEDIATE stmt INTO vcount
    USING  nls_upper(user_name), nls_upper(:n.table_name), nls_upper(:n.column_name) ;

  IF vcount = 0 THEN
    INSERT INTO sdo_lrs_metadata_table values
             (nls_upper(user_name), nls_upper(:n.table_name), nls_upper(:n.column_name), :n.dim_pos, nls_upper(:n.dim_unit));
  ELSE
   mderr.raise_md_error('MD', 'SDO', -13223,
           user_name||'.'||:n.table_name);
 END IF;
END;
/