CREATE OR REPLACE NONEDITIONABLE TRIGGER
  mdsys.OGIS_CRS_DELETE_TRIGGER
BEFORE
  DELETE
ON
  mdsys.ogis_spatial_reference_systems
FOR EACH ROW
BEGIN
  DELETE FROM mdsys.sdo_coord_ref_system WHERE SRID = :old.srid;
END;
/