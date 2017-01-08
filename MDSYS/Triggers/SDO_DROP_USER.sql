CREATE OR REPLACE NONEDITIONABLE trigger mdsys.sdo_drop_user
after drop on DATABASE
declare
   stmt varchar2(200);
   cnt number;
BEGIN
     if sys.dbms_standard.dictionary_obj_type = 'USER' THEN
       stmt := 'DELETE FROM SDO_GEOM_METADATA_TABLE ' ||
     ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_MAPS_TABLE ' ||
    ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_CACHED_MAPS_TABLE ' ||
    ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_STYLES_TABLE ' ||
    ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_THEMES_TABLE ' ||
   ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_LRS_METADATA_TABLE ' ||
   ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_TOPO_METADATA_TABLE ' ||
   ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_ANNOTATION_TEXT_METADATA ' ||
   ' WHERE F_TABLE_SCHEMA = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;
    end if;
end;
/