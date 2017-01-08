CREATE TABLE mdsys.sdo_prime_meridians (
  prime_meridian_id NUMBER(10) NOT NULL CONSTRAINT prime_meridian_id_must_be_pos CHECK (PRIME_MERIDIAN_ID > 0),
  prime_meridian_name VARCHAR2(80 BYTE) NOT NULL,
  greenwich_longitude FLOAT(49),
  uom_id NUMBER(10),
  information_source VARCHAR2(254 BYTE),
  data_source VARCHAR2(254 BYTE),
  CONSTRAINT prime_meridian_prim PRIMARY KEY (prime_meridian_id),
  UNIQUE (prime_meridian_name),
  CONSTRAINT prime_meridian_foreign_uom FOREIGN KEY (uom_id) REFERENCES mdsys.sdo_units_of_measure (uom_id)
);