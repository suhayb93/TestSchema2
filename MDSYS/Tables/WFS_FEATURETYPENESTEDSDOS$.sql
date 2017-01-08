CREATE TABLE mdsys.wfs_featuretypenestedsdos$ (
  featuretypeid NUMBER,
  objnamespace VARCHAR2(30 BYTE),
  objname VARCHAR2(30 BYTE),
  objnameindex NUMBER,
  FOREIGN KEY (featuretypeid) REFERENCES mdsys.wfs_featuretype$ (featuretypeid) ON DELETE CASCADE
);