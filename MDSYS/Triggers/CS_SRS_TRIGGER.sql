CREATE OR REPLACE NONEDITIONABLE TRIGGER
  mdsys.CS_SRS_TRIGGER
INSTEAD OF
  UPDATE OR
  INSERT OR
  DELETE
ON
  mdsys.CS_SRS
FOR EACH ROW
BEGIN
  mdsys.sdo_cs.sdo_cs_context_invalidate;

  if(not(:old.srid is null)) then
    delete from sdo_coord_ref_system crs where crs.srid = :old.srid;
  end if;
  if(not(:new.srid is null)) then
    if(nls_upper(trim(:new.wktext)) like 'GEOGCS%') then
      insert into sdo_coord_ref_system (
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
      values(
        :new.SRID,
        :new.CS_NAME,
        'GEOGRAPHIC2D',
        null,
        1000000123,
        1000000123,
        null,
        null,
        null,
        null,
        :new.AUTH_NAME,
        null,
        'TRUE',
        null,
        :new.WKTEXT,
        :new.CS_BOUNDS,
        'TRUE',
        'TRUE');
    else
      insert into sdo_coord_ref_system (
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
      values(
        :new.SRID,
        :new.CS_NAME,
        'PROJECTED',
        null,
        null,
        1000000123,
        1000000123,
        null,
        null,
        null,
        :new.AUTH_NAME,
        null,
        'TRUE',
        null,
        :new.WKTEXT,
        :new.CS_BOUNDS,
        'TRUE',
        'TRUE');
    end if;
  end if;
END;
/