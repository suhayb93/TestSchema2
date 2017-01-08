CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.sdo_crs_compound (srid,coord_ref_sys_name,cmpd_horiz_srid,cmpd_vert_srid,information_source,data_source) AS
SELECT
          SRID,
          COORD_REF_SYS_NAME,
          CMPD_HORIZ_SRID,
          CMPD_VERT_SRID,
          INFORMATION_SOURCE,
          DATA_SOURCE
        FROM
          mdsys.SDO_COORD_REF_SYS
        WHERE
          COORD_REF_SYS_KIND = 'COMPOUND';