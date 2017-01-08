CREATE TABLE mdsys.wfs_featureinstancemetadata$ (
  featuretypeid NUMBER,
  featureid VARCHAR2(80 BYTE),
  islocked VARCHAR2(1 BYTE),
  lockexpiry NUMBER,
  lockacquiretime TIMESTAMP,
  lockid VARCHAR2(80 BYTE),
  FOREIGN KEY (featuretypeid) REFERENCES mdsys.wfs_featuretype$ (featuretypeid) ON DELETE CASCADE
);