CREATE TABLE mdsys.wfs_srs$ (
  featuretypeid NUMBER,
  customsrsnameprefixes VARCHAR2(4000 BYTE),
  defaultsrs VARCHAR2(4000 BYTE),
  othersrss mdsys.stringlist
);