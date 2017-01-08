CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.sdo_crs_projected (srid,coord_ref_sys_name,coord_sys_id,source_geog_srid,projection_conv_id,information_source,data_source) AS
SELECT
          SRID,
          COORD_REF_SYS_NAME,
          COORD_SYS_ID,
          SOURCE_GEOG_SRID,
          PROJECTION_CONV_ID,
          INFORMATION_SOURCE,
          DATA_SOURCE
        FROM
          mdsys.SDO_COORD_REF_SYS
        WHERE
          COORD_REF_SYS_KIND = 'PROJECTED';