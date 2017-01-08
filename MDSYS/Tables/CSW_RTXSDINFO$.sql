CREATE TABLE mdsys.csw_rtxsdinfo$ (
  rtxsdrefid VARCHAR2(80 BYTE) NOT NULL,
  rtdef XMLTYPE,
  PRIMARY KEY (rtxsdrefid)
);