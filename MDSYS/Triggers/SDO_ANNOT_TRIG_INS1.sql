CREATE OR REPLACE NONEDITIONABLE TRIGGER mdsys.SDO_ANNOT_TRIG_INS1
INSTEAD OF INSERT OR DELETE OR UPDATE ON mdsys.USER_ANNOTATION_TEXT_METADATA
REFERENCING NEW AS n OLD as o
FOR EACH ROW
declare
 tname varchar2(32);
begin

  IF INSERTING THEN
 EXECUTE IMMEDIATE
  'SELECT user FROM dual' into tname;
      INSERT INTO SDO_ANNOTATION_TEXT_METADATA values(null,tname,
            nls_upper(:n.table_name), nls_upper(:n.column_name), :n.MAP_BASE_SCALE,
                 :n.TEXT_EXPRESSION,
             :n.TEXT_ATTRIBUTES);
  ELSIF UPDATING THEN
 EXECUTE IMMEDIATE
  'SELECT user FROM dual' into tname;
  UPDATE SDO_ANNOTATION_TEXT_METADATA SET(F_TABLE_SCHEMA,
             F_TABLE_NAME,F_TEXT_COLUMN, MAP_BASE_SCALE, TEXT_DEFAULT_EXPRESSION,
                    TEXT_DEFAULT_ATTRIBUTES) =
   (SELECT tname, :n.table_name, :n.column_name, :n.MAP_BASE_SCALE,
                    :n.TEXT_EXPRESSION,
           :n.TEXT_ATTRIBUTES FROM DUAL)
  WHERE F_TABLE_SCHEMA =  tname AND
     F_TABLE_NAME = :o.table_name AND F_TEXT_COLUMN = :o.column_name;
  ELSE
 EXECUTE IMMEDIATE
  'SELECT user FROM dual' into tname;
   DELETE FROM SDO_ANNOTATION_TEXT_METADATA
    WHERE  F_TABLE_SCHEMA =  tname AND
     F_TABLE_NAME = :o.table_name AND F_TEXT_COLUMN = :o.column_name;
  END IF;
end;
/