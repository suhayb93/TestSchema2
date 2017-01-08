CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_geor_sysdata (table_name,column_name,metadata_column_name,rdt_table_name,raster_id,other_table_names) AS
SELECT TABLE_NAME, COLUMN_NAME,METADATA_COLUMN_NAME,
              RDT_TABLE_NAME,RASTER_ID,OTHER_TABLE_NAMES
FROM ALL_SDO_GEOR_SYSDATA
WHERE owner = sys_context('userenv', 'CURRENT_USER');