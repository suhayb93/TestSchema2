CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_NETWORK_DROP_USER
AFTER DROP ON DATABASE
DECLARE
  stmt    VARCHAR2(256);
BEGIN

  IF  sys.dbms_standard.dictionary_obj_type = 'USER'  THEN
    stmt := 'DELETE FROM SDO_NETWORK_METADATA_TABLE WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_CONSTRAINTS WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_LOCKS_WM WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_USER_DATA WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    --lrg-3417773
    stmt := 'DELETE FROM SDO_NETWORK_HISTORIES WHERE OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_TIMESTAMPS WHERE OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_FEATURE WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

  END IF;
END ;
/