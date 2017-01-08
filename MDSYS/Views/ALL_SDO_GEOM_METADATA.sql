CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.all_sdo_geom_metadata ("OWNER",table_name,column_name,diminfo,srid) AS
SELECT  b.SDO_OWNER OWNER,
        b.SDO_TABLE_NAME TABLE_NAME,
        b.SDO_COLUMN_NAME COLUMN_NAME,
        b.SDO_DIMINFO DIMINFO,
        b.SDO_SRID SRID
FROM mdsys.SDO_GEOM_METADATA_TABLE b,
     all_objects a
WHERE  b.sdo_table_name = a.object_name
  AND  b.sdo_owner = a.owner
  AND  a.object_type in ('TABLE', 'SYNONYM', 'VIEW');