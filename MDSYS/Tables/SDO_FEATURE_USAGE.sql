CREATE TABLE mdsys.sdo_feature_usage (
  feature_name VARCHAR2(24 BYTE) NOT NULL,
  used VARCHAR2(1 BYTE),
  PRIMARY KEY (feature_name)
);