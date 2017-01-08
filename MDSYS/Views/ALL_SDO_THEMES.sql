CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_themes ("OWNER","NAME",description,base_table,geometry_column,styling_rules) AS
SELECT SDO_OWNER OWNER, NAME, DESCRIPTION, BASE_TABLE,
                  GEOMETRY_COLUMN, STYLING_RULES
FROM SDO_THEMES_TABLE
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