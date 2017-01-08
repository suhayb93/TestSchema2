CREATE TABLE mdsys.ogis_spatial_reference_systems (
  srid NUMBER NOT NULL,
  auth_name VARCHAR2(100 BYTE),
  auth_srid NUMBER,
  srtext VARCHAR2(1000 BYTE),
  srnum NUMBER,
  CONSTRAINT pk_srid PRIMARY KEY (srid)
);