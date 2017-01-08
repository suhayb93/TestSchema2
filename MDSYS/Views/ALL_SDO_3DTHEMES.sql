CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_3dthemes ("OWNER","NAME",description,base_table,theme_column,style_column,theme_type,definition) AS
SELECT SDO_OWNER OWNER, NAME, DESCRIPTION, BASE_TABLE,
                  THEME_COLUMN, STYLE_COLUMN, THEME_TYPE, DEFINITION
FROM SDO_3DTHEMES_TABLE
WHERE
(exists
   (select table_name from all_tables
    where table_name=base_table
      and owner = sdo_owner
    union all
      select table_name from all_object_tables
      where table_name=base_table
      and owner = sdo_owner
    union all
    select view_name table_name from all_views
    where  view_name=base_table
      and owner = sdo_owner));