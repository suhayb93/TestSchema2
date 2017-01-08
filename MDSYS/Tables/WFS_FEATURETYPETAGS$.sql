CREATE TABLE mdsys.wfs_featuretypetags$ (
  featuretypeid NUMBER,
  tagname VARCHAR2(80 BYTE),
  tagseqno NUMBER(*,0),
  tagtype VARCHAR2(80 BYTE),
  tagtypensurl VARCHAR2(2083 BYTE),
  columnname VARCHAR2(30 BYTE),
  isnullable VARCHAR2(1 BYTE),
  datalength NUMBER,
  ismandatory VARCHAR2(1 BYTE),
  dbtypename VARCHAR2(80 BYTE),
  ftvaryingnsalias VARCHAR2(123 BYTE),
  FOREIGN KEY (featuretypeid) REFERENCES mdsys.wfs_featuretype$ (featuretypeid) ON DELETE CASCADE
);