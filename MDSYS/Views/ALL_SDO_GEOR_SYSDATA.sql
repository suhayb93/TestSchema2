CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_geor_sysdata ("OWNER",table_name,column_name,metadata_column_name,rdt_table_name,raster_id,other_table_names) AS
SELECT SDO_OWNER                 OWNER,
       GEORASTER_TABLE_NAME      TABLE_NAME,
       GEORASTER_COLUMN_NAME     COLUMN_NAME,
       GEOR_METADATA_COLUMN_NAME METADATA_COLUMN_NAME,
       RDT_TABLE_NAME            RDT_TABLE_NAME,
       RASTER_ID                 RASTER_ID,
       OTHER_TABLE_NAMES         OTHER_TABLE_NAMES
FROM SDO_GEOR_SYSDATA_TABLE
WHERE
(
    (sdo_owner = sys_context('userenv', 'CURRENT_USER'))
    or
    exists
    (
     select table_name from all_tables
     where table_name=georaster_table_name
     and owner = sdo_owner
     union all
     select table_name from all_object_tables
     where table_name=georaster_table_name
     and owner = sdo_owner
     union all
     select view_name table_name from all_views
     where  view_name=georaster_table_name
     and owner = sdo_owner
     )
);