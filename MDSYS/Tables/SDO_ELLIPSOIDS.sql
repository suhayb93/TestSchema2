CREATE TABLE mdsys.sdo_ellipsoids (
  ellipsoid_id NUMBER NOT NULL CONSTRAINT ellipsoid_id_must_be_pos CHECK (ELLIPSOID_ID > 0),
  ellipsoid_name VARCHAR2(80 BYTE) NOT NULL,
  semi_major_axis NUMBER CONSTRAINT semi_major_axis_must_be_pos CHECK (SEMI_MAJOR_AXIS > 0),
  uom_id NUMBER,
  inv_flattening NUMBER,
  semi_minor_axis NUMBER,
  information_source VARCHAR2(254 BYTE),
  data_source VARCHAR2(40 BYTE),
  is_legacy VARCHAR2(5 BYTE) NOT NULL,
  legacy_code NUMBER,
  CONSTRAINT ellipsoid_prim PRIMARY KEY (ellipsoid_id),
  CONSTRAINT ellipsoid_foreign_uom FOREIGN KEY (uom_id) REFERENCES mdsys.sdo_units_of_measure (uom_id)
);