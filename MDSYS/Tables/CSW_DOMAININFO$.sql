CREATE TABLE mdsys.csw_domaininfo$ (
  recordtypeid NUMBER,
  propertyname VARCHAR2(100 BYTE),
  parametername VARCHAR2(100 BYTE),
  pvalue mdsys.stringlist,
  FOREIGN KEY (recordtypeid) REFERENCES mdsys.csw_record_types$ (recordtypeid) ON DELETE CASCADE
);