CREATE OR REPLACE NONEDITIONABLE TRIGGER
  mdsys.SDO_CRS_INSERT_TRIGGER
INSTEAD OF
  INSERT
ON
  mdsys.SDO_COORD_REF_SYSTEM
FOR EACH ROW
DECLARE
  already_exists  NUMBER;
BEGIN
  mdsys.sdo_cs.sdo_cs_context_invalidate;

  INSERT INTO mdsys.SDO_COORD_REF_SYS (
    SRID,
    COORD_REF_SYS_NAME,
    COORD_REF_SYS_KIND,
    COORD_SYS_ID,
    DATUM_ID,
    GEOG_CRS_DATUM_ID,
    SOURCE_GEOG_SRID,
    PROJECTION_CONV_ID,
    CMPD_HORIZ_SRID,
    CMPD_VERT_SRID,
    INFORMATION_SOURCE,
    DATA_SOURCE,
    IS_LEGACY,
    LEGACY_CODE,
    LEGACY_WKTEXT,
    LEGACY_CS_BOUNDS,
    IS_VALID,
    SUPPORTS_SDO_GEOMETRY)
  VALUES (
    :new.SRID,
    :new.COORD_REF_SYS_NAME,
    :new.COORD_REF_SYS_KIND,
    :new.COORD_SYS_ID,
    :new.DATUM_ID,
    :new.GEOG_CRS_DATUM_ID,
    :new.SOURCE_GEOG_SRID,
    :new.PROJECTION_CONV_ID,
    :new.CMPD_HORIZ_SRID,
    :new.CMPD_VERT_SRID,
    :new.INFORMATION_SOURCE,
    :new.DATA_SOURCE,
    :new.IS_LEGACY,
    :new.LEGACY_CODE,
    :new.LEGACY_WKTEXT,
    :new.LEGACY_CS_BOUNDS,
    :new.IS_VALID,
    :new.SUPPORTS_SDO_GEOMETRY);

  INSERT INTO mdsys.SDO_CS_SRS (
    CS_NAME,
    SRID,
    AUTH_SRID,
    AUTH_NAME,
    WKTEXT,
    wktext3d,
    CS_BOUNDS
    )
  VALUES (
    :new.COORD_REF_SYS_NAME,
    :new.SRID,
    :new.SRID,
    :new.INFORMATION_SOURCE,
    NVL(
      :new.LEGACY_WKTEXT,
      mdsys.sdo_cs.internal_det_srid_wkt(:new.srid)),
    sdo_cs.get_3d_wkt(:new.srid),
    :new.LEGACY_CS_BOUNDS);

    if(:new.COORD_REF_SYS_KIND = 'GEOGRAPHIC3D') then
      insert into sdo_crs_geographic_plus_height values (:new.srid);
    elsif(:new.COORD_REF_SYS_KIND = 'COMPOUND') then
      insert into sdo_crs_geographic_plus_height (
        select :new.srid from sdo_crs_geographic2d g2d
        where g2d.srid = :new.CMPD_HORIZ_SRID);
    end if;

END;
/