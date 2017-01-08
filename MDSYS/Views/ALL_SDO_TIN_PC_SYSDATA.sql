CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_tin_pc_sysdata ("OWNER",table_name,column_name,dep_table_schema,dep_table_name) AS
SELECT SDO_OWNER                 OWNER,
       TABLE_NAME,
       COLUMN_NAME,
       DEP_TABLE_SCHEMA,
       DEP_TABLE_NAME
FROM SDO_TIN_PC_SYSDATA_TABLE a
WHERE
(
    exists
    (
     select table_name from all_tables
     where table_name=a.table_name
     and owner = sdo_owner
     union all
     select table_name from all_object_tables
     where table_name=a.table_name
     and owner = sdo_owner
     union all
     select view_name table_name from all_views
     where  view_name=a.table_name
     and owner = sdo_owner
     )
);