CREATE TABLE mdsys.wfs_ftxsdinfo$ (
  ftxsdrefid VARCHAR2(80 BYTE) NOT NULL,
  ftdef XMLTYPE,
  PRIMARY KEY (ftxsdrefid)
);