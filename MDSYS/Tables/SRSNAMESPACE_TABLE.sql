CREATE TABLE mdsys.srsnamespace_table (
  srsnamespace VARCHAR2(2000 BYTE) NOT NULL,
  srsname VARCHAR2(2000 BYTE) NOT NULL,
  sdo_srid NUMBER,
  PRIMARY KEY (srsnamespace,srsname)
);