CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_themes ("NAME",description,base_table,geometry_column,styling_rules) AS
SELECT NAME, DESCRIPTION, BASE_TABLE, GEOMETRY_COLUMN, STYLING_RULES
FROM SDO_THEMES_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_SCHEMA');