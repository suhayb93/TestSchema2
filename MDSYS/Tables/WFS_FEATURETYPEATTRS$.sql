CREATE TABLE mdsys.wfs_featuretypeattrs$ (
  featuretypeid NUMBER,
  attrname VARCHAR2(80 BYTE),
  attrseqno NUMBER(*,0),
  attrtype VARCHAR2(80 BYTE),
  attrtypensurl VARCHAR2(2083 BYTE),
  columnname VARCHAR2(30 BYTE),
  isnullable VARCHAR2(1 BYTE),
  datalength NUMBER,
  ismandatory VARCHAR2(1 BYTE),
  dbtypename VARCHAR2(80 BYTE),
  FOREIGN KEY (featuretypeid) REFERENCES mdsys.wfs_featuretype$ (featuretypeid) ON DELETE CASCADE
);