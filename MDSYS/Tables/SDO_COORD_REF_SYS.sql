CREATE TABLE mdsys.sdo_coord_ref_sys (
  srid NUMBER(10) NOT NULL CONSTRAINT srid_must_be_pos CHECK (SRID > 0),
  coord_ref_sys_name VARCHAR2(80 BYTE) NOT NULL,
  coord_ref_sys_kind VARCHAR2(24 BYTE) NOT NULL,
  coord_sys_id NUMBER(10),
  datum_id NUMBER(10),
  geog_crs_datum_id NUMBER(10),
  source_geog_srid NUMBER(10),
  projection_conv_id NUMBER(10),
  cmpd_horiz_srid NUMBER(10),
  cmpd_vert_srid NUMBER(10),
  information_source VARCHAR2(254 BYTE),
  data_source VARCHAR2(40 BYTE),
  is_legacy VARCHAR2(5 BYTE) NOT NULL,
  legacy_code NUMBER(10),
  legacy_wktext VARCHAR2(2046 BYTE),
  legacy_cs_bounds mdsys.sdo_geometry,
  is_valid VARCHAR2(5 BYTE) DEFAULT 'TRUE',
  supports_sdo_geometry VARCHAR2(5 BYTE) DEFAULT 'TRUE',
  CONSTRAINT crs_check_compound CHECK (
          (IS_VALID = 'FALSE') OR
          (IS_LEGACY = 'TRUE') OR
          (coord_ref_sys_kind <> 'COMPOUND') OR
          (
            (     SOURCE_GEOG_SRID    IS NULL) AND
            (     PROJECTION_CONV_ID  IS NULL) AND
            (NOT  CMPD_HORIZ_SRID     IS NULL) AND
            (NOT  CMPD_VERT_SRID      IS NULL) AND
            (     COORD_SYS_ID        IS NULL) AND
            (     DATUM_ID            IS NULL)
          )
        ),
  CONSTRAINT crs_check_engineering CHECK (
          (IS_VALID = 'FALSE') OR
          (IS_LEGACY = 'TRUE') OR
          (coord_ref_sys_kind <> 'ENGINEERING') OR
          (
            (     SOURCE_GEOG_SRID    IS NULL) AND
            (     PROJECTION_CONV_ID  IS NULL) AND
            (     CMPD_HORIZ_SRID     IS NULL) AND
            (     CMPD_VERT_SRID      IS NULL) AND
            (NOT  COORD_SYS_ID        IS NULL) AND
            (NOT  DATUM_ID            IS NULL) AND
            (NOT  GEOG_CRS_DATUM_ID   IS NULL)
          )
        ),
  CONSTRAINT crs_check_geocentric CHECK (
          (IS_VALID = 'FALSE') OR
          (IS_LEGACY = 'TRUE') OR
          (coord_ref_sys_kind <> 'GEOCENTRIC') OR
          (
            (     SOURCE_GEOG_SRID    IS NULL) AND
            (     PROJECTION_CONV_ID  IS NULL) AND
            (     CMPD_HORIZ_SRID     IS NULL) AND
            (     CMPD_VERT_SRID      IS NULL) AND
            (NOT  COORD_SYS_ID        IS NULL) AND
            (NOT  DATUM_ID            IS NULL) AND
            (NOT  GEOG_CRS_DATUM_ID   IS NULL)
          )
        ),
  CONSTRAINT crs_check_geographic2d CHECK (
          (IS_VALID = 'FALSE') OR
          (IS_LEGACY = 'TRUE') OR
          (coord_ref_sys_kind <> 'GEOGRAPHIC2D') OR
          (
            (     SOURCE_GEOG_SRID    IS NULL) AND
            (     PROJECTION_CONV_ID  IS NULL) AND
            (     CMPD_HORIZ_SRID     IS NULL) AND
            (     CMPD_VERT_SRID      IS NULL) AND
            (NOT  COORD_SYS_ID        IS NULL) AND
            (NOT  DATUM_ID            IS NULL) AND
            (NOT  GEOG_CRS_DATUM_ID   IS NULL)
          )
        ),
  CONSTRAINT crs_check_geographic3d CHECK (
          (IS_VALID = 'FALSE') OR
          (IS_LEGACY = 'TRUE') OR
          (coord_ref_sys_kind <> 'GEOGRAPHIC3D') OR
          (
            (     SOURCE_GEOG_SRID    IS NULL) AND
            (     PROJECTION_CONV_ID  IS NULL) AND
            (     CMPD_HORIZ_SRID     IS NULL) AND
            (     CMPD_VERT_SRID      IS NULL) AND
            (NOT  COORD_SYS_ID        IS NULL) AND
            (NOT  DATUM_ID            IS NULL) AND
            (NOT  GEOG_CRS_DATUM_ID   IS NULL)
          )
        ),
  CONSTRAINT crs_check_projected CHECK (
          (IS_VALID = 'FALSE') OR
          (IS_LEGACY = 'TRUE') OR
          (coord_ref_sys_kind <> 'PROJECTED') OR
          (
            (NOT  SOURCE_GEOG_SRID    IS NULL) AND
            (NOT  PROJECTION_CONV_ID  IS NULL) AND
            (     CMPD_HORIZ_SRID     IS NULL) AND
            (     CMPD_VERT_SRID      IS NULL) AND
            (NOT  COORD_SYS_ID        IS NULL) AND
            (     DATUM_ID            IS NULL) AND
            (NOT  GEOG_CRS_DATUM_ID   IS NULL)
          )
        ),
  CONSTRAINT crs_check_vertical CHECK (
          (IS_VALID = 'FALSE') OR
          (IS_LEGACY = 'TRUE') OR
          (coord_ref_sys_kind <> 'VERTICAL') OR
          (
            (     SOURCE_GEOG_SRID    IS NULL) AND
            (     PROJECTION_CONV_ID  IS NULL) AND
            (     CMPD_HORIZ_SRID     IS NULL) AND
            (     CMPD_VERT_SRID      IS NULL) AND
            (NOT  COORD_SYS_ID        IS NULL) AND
            (NOT  DATUM_ID            IS NULL) AND
            (NOT  GEOG_CRS_DATUM_ID   IS NULL)
          )
        ),
  CONSTRAINT coord_ref_system_prim PRIMARY KEY (srid),
  CONSTRAINT coord_ref_sys_foreign_cs FOREIGN KEY (coord_sys_id) REFERENCES mdsys.sdo_coord_sys (coord_sys_id),
  CONSTRAINT coord_ref_sys_foreign_datum FOREIGN KEY (datum_id) REFERENCES mdsys.sdo_datums (datum_id),
  CONSTRAINT coord_ref_sys_foreign_geog FOREIGN KEY (source_geog_srid) REFERENCES mdsys.sdo_coord_ref_sys (srid),
  CONSTRAINT coord_ref_sys_foreign_horiz FOREIGN KEY (cmpd_horiz_srid) REFERENCES mdsys.sdo_coord_ref_sys (srid),
  CONSTRAINT coord_ref_sys_foreign_legacy FOREIGN KEY (legacy_code) REFERENCES mdsys.sdo_coord_ref_sys (srid),
  CONSTRAINT coord_ref_sys_foreign_proj FOREIGN KEY (projection_conv_id) REFERENCES mdsys.sdo_coord_ops (coord_op_id),
  CONSTRAINT coord_ref_sys_foreign_vert FOREIGN KEY (cmpd_vert_srid) REFERENCES mdsys.sdo_coord_ref_sys (srid)
);