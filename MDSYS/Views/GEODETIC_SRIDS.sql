CREATE OR REPLACE FORCE NONEDITIONABLE VIEW mdsys.geodetic_srids (srid) AS
select srid from mdsys.CS_SRS where WKTEXT like 'GEOGCS%'
  minus
  select srid from mdsys.SDO_COORD_REF_SYS where coord_ref_sys_kind = 'GEOCENTRIC';