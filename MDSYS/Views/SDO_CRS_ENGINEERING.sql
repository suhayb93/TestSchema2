CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.sdo_crs_engineering (srid,coord_ref_sys_name,coord_sys_id,datum_id,information_source,data_source) AS
SELECT
          SRID,
          COORD_REF_SYS_NAME,
          COORD_SYS_ID,
          DATUM_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE
        FROM
          mdsys.SDO_COORD_REF_SYS
        WHERE
          COORD_REF_SYS_KIND = 'ENGINEERING';