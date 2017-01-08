CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.user_sdo_geom_metadata (table_name,column_name,diminfo,srid) AS
SELECT SDO_TABLE_NAME TABLE_NAME,
       SDO_COLUMN_NAME COLUMN_NAME,
       SDO_DIMINFO DIMINFO,
       SDO_SRID SRID
FROM SDO_GEOM_METADATA_TABLE
WHERE  sdo_owner = sys_context('userenv', 'CURRENT_USER');