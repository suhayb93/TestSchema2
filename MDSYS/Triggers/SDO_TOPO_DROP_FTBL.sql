CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.sdo_topo_drop_ftbl
  BEFORE DROP ON DATABASE
  DISABLE DECLARE
    cnt        NUMBER;
    stmt       VARCHAR(500);
    topology   VARCHAR(100);
    REG_TBL    EXCEPTION;

  BEGIN
    if(sys.dbms_standard.dictionary_obj_type != 'TABLE')
    then
      return;
    end if;
    stmt := 'SELECT topology ' ||
     'FROM MDSYS.SDO_TOPO_METADATA_TABLE a, TABLE(a.Topo_Geometry_Layers) b ' ||
     'WHERE b.owner = :owner AND b.table_name = :tab ';
    EXECUTE IMMEDIATE stmt into topology
      USING sys.dbms_standard.DICTIONARY_OBJ_OWNER,
            sys.dbms_standard.DICTIONARY_OBJ_NAME;
    RAISE REG_TBL;

    EXCEPTION
      WHEN REG_TBL THEN
        mdsys.MDERR.raise_md_error(
         'MD', 'SDO', -13199,
         'Need to use delete_topo_geometry_layer() to deregister table '
       || sys.dbms_standard.DICTIONARY_OBJ_NAME ||
             ' from topology ' || topology ||
         ' before dropping it');
      WHEN OTHERS THEN
        RETURN;
  END;
/