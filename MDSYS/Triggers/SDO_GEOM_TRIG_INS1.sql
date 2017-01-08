CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_GEOM_TRIG_INS1
INSTEAD OF INSERT ON mdsys.user_sdo_geom_metadata
REFERENCING NEW AS n
FOR EACH ROW
declare
 tname varchar2(32);
 stmt  varchar2(2048);
 vcount INTEGER;
 dimcount INTEGER;
 tolerance NUMBER;
 dimelement mdsys.SDO_DIM_ELEMENT;
 idx  number;
BEGIN
  tname := user;

  if ( (instr(:n.table_name, ' ') > 0 ) OR
       (instr(:n.table_name, '''') > 0 ) )  then
   mderr.raise_md_error('MD', 'SDO', -13199,
               'wrong table name: ' || :n.table_name);
   end if;

  if ( (instr(:n.column_name, ' ') > 0 ) OR
       (instr(:n.column_name, '''') > 0 ) ) then
   mderr.raise_md_error('MD', 'SDO', -13199,
               'wrong column name: ' || :n.column_name);
   end if;

  stmt :=  'SELECT count(*) FROM SDO_GEOM_METADATA_TABLE ' ||
  'WHERE sdo_owner = :tname  AND sdo_table_name = :table_name  '||
  '  AND  sdo_column_name = :column_name  ';

EXECUTE IMMEDIATE stmt INTO vcount
   USING tname, nls_upper(:n.table_name), nls_upper(:n.column_name);


  IF vcount = 0 THEN
    dimcount :=  :n.diminfo.count;
    FOR idx in 1 .. dimcount LOOP
      dimelement := :n.diminfo(idx);
      tolerance := dimelement.SDO_TOLERANCE;
      if ( (tolerance is NULL) OR (tolerance <= 0) ) then
          mderr.raise_md_error('MD', 'SDO', -13224,
                :n.table_name||'.'||:n.column_name);
      end if;
    END LOOP;

    mdsys.sdo_meta.insert_all_sdo_geom_metadata(tname,
                                                :n.table_name,
                                                :n.column_name,
                                                :n.diminfo,
                                                :n.srid);
  ELSE
   mderr.raise_md_error('MD', 'SDO', -13223,
               :n.table_name||'.'||:n.column_name);
 END IF;
END;
/