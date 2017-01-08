CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_3dthemes ("NAME",description,base_table,theme_column,style_column,theme_type,definition) AS
SELECT NAME, DESCRIPTION, BASE_TABLE, THEME_COLUMN, STYLE_COLUMN, THEME_TYPE, DEFINITION
FROM SDO_3DTHEMES_TABLE
WHERE sdo_owner = sys_context('userenv', 'CURRENT_USER');