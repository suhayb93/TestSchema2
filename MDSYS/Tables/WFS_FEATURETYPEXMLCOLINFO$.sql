CREATE TABLE mdsys.wfs_featuretypexmlcolinfo$ (
  "ID" NUMBER NOT NULL,
  featuretypeid NUMBER,
  ftnamespaceurl VARCHAR2(2083 BYTE),
  xsddesc XMLTYPE,
  xsdwrapperdesc XMLTYPE,
  columnname VARCHAR2(30 BYTE),
  objpathinfo mdsys.stringlist,
  lastupdatets TIMESTAMP,
  lastwrappergeneratets TIMESTAMP,
  PRIMARY KEY ("ID"),
  FOREIGN KEY (featuretypeid) REFERENCES mdsys.wfs_featuretype$ (featuretypeid) ON DELETE CASCADE
);