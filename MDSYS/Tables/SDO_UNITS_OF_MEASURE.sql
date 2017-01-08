CREATE TABLE mdsys.sdo_units_of_measure (
  uom_id NUMBER(10) NOT NULL CONSTRAINT uom_id_must_be_pos CHECK (UOM_ID > 0),
  unit_of_meas_name VARCHAR2(2083 BYTE) NOT NULL,
  short_name VARCHAR2(80 BYTE),
  legacy_unit_name VARCHAR2(80 BYTE),
  unit_of_meas_type VARCHAR2(50 BYTE) CONSTRAINT uom_type_constr CHECK (nls_lower(unit_of_meas_type) in ('area', 'angle', 'length', 'scale', 'volume')),
  target_uom_id NUMBER(10) CONSTRAINT only_std_target_uoms CHECK (target_uom_id in (9001, 9101, 9201, 10008, 19501)),
  factor_b NUMBER CONSTRAINT factor_b_must_be_pos CHECK (FACTOR_B IS NULL OR FACTOR_B > 0),
  factor_c NUMBER CONSTRAINT factor_c_must_be_pos CHECK (FACTOR_C IS NULL OR FACTOR_C > 0),
  information_source VARCHAR2(254 BYTE),
  data_source VARCHAR2(40 BYTE),
  is_legacy VARCHAR2(5 BYTE) NOT NULL,
  legacy_code NUMBER(10),
  CONSTRAINT unit_of_measure_prim PRIMARY KEY (uom_id),
  CONSTRAINT uom_unique1 UNIQUE (uom_id,unit_of_meas_type),
  CONSTRAINT uom_unique_short_name UNIQUE (short_name),
  CONSTRAINT ellipsoid_foreign_legacy FOREIGN KEY (legacy_code) REFERENCES mdsys.sdo_ellipsoids (ellipsoid_id),
  CONSTRAINT unit_of_measure_foreign_legacy FOREIGN KEY (legacy_code) REFERENCES mdsys.sdo_units_of_measure (uom_id),
  CONSTRAINT unit_of_measure_foreign_uom FOREIGN KEY (target_uom_id) REFERENCES mdsys.sdo_units_of_measure (uom_id)
);