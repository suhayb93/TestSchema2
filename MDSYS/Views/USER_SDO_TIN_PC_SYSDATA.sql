CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_tin_pc_sysdata ("OWNER",table_name,column_name,dep_table_schema,dep_table_name) AS
SELECT "OWNER","TABLE_NAME","COLUMN_NAME","DEP_TABLE_SCHEMA","DEP_TABLE_NAME"  FROM all_sdo_tin_pc_sysdata
WHERE owner = sys_context('userenv', 'CURRENT_SCHEMA');