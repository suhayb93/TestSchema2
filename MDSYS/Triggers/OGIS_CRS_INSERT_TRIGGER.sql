CREATE OR REPLACE NONEDITIONABLE TRIGGER
  mdsys.OGIS_CRS_INSERT_TRIGGER
BEFORE
  INSERT
ON
  mdsys.ogis_spatial_reference_systems
FOR EACH ROW
BEGIN
  IF(nls_upper(TRIM(:new.srtext)) like 'GEOGCS%') THEN
    insert into mdsys.sdo_coord_ref_system (
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
      'OGIS ' || :new.SRID,
      'GEOGRAPHIC2D',
      NULL,
      1000000123,
      1000000123,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      'TRUE',
      NULL,
      :new.SRTEXT,
      NULL,
      'TRUE',
      'TRUE');
  ELSE
    insert into mdsys.sdo_coord_ref_system (
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
      'OGIS ' || :new.SRID,
      'PROJECTED',
      NULL,
      NULL,
      1000000123,
      1000000123,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      'TRUE',
      NULL,
      :new.SRTEXT,
      NULL,
      'TRUE',
      'TRUE');
  END IF;
END;
/