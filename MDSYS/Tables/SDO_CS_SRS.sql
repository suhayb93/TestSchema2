CREATE TABLE mdsys.sdo_cs_srs (
  cs_name VARCHAR2(80 BYTE),
  srid NUMBER(*,0) NOT NULL,
  auth_srid NUMBER(*,0),
  auth_name VARCHAR2(256 BYTE),
  wktext VARCHAR2(2046 BYTE),
  cs_bounds mdsys.sdo_geometry,
  wktext3d VARCHAR2(4000 BYTE),
  PRIMARY KEY (srid)
);