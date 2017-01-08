CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.chk_sdo_dimname
  BEFORE INSERT OR UPDATE ON mdsys.SDO_GEOM_METADATA_TABLE
  FOR EACH ROW
DECLARE
  cnt   NUMBER;
  res   NUMBER;
BEGIN
  FOR cnt IN 1 .. :NEW.sdo_diminfo.COUNT LOOP



    SELECT REGEXP_INSTR(:NEW.sdo_diminfo(cnt).sdo_dimname, '[^[:alnum:]_]')
      INTO res FROM DUAL;
    IF (res > 0) THEN
      mderr.raise_md_error('MD', 'SDO_GEOM_METADATA_TABLE',-13249,
      'Only alphanumeric characters and "_" are allowed in SDO_DIMNAME');
    END IF;

  END LOOP;


  mdsys.mdprvt_gmd.invalidate_geom_metadata(:new.sdo_owner,
                                            :new.sdo_table_name,
                                            :new.sdo_column_name);
END;
/